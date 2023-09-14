//
//  SetView.swift
//  iOS_1101_Hw3
//
//  Created by CK on 2021/12/14.
//

import SwiftUI

struct SetView: View {
    @State private var selectTime = Date()
    @State private var pickIndex = 0
    @State private var adviceIndex = 0
    @State private var showSecondView = false
    @Binding var showSetView : Bool
    @State private var name = ""
    @State private var isExpanded = false
    
    let methods = ["請我吃宵夜","把你的信用卡給我","幫我寫作業"]
    var mood = ["開心","難過","放鬆"]
    @State private var bgColor = Color.red

     
    var body: some View {
        
        VStack{
            
            Form{
                Text("告訴我你現在的狀態")
                    .font(.largeTitle)
                Section{
                    TextField("你的名字", text: $name, onEditingChanged: { (editing) in
                        print("onEditingChanged", editing)
                        
                    })
                }
                
                Section{
                    Text("你現在的心情如何呀？")
                    Picker(selection: $pickIndex, label: Text("")) {
                        ForEach(0 ..< mood.count) { i in
                            Text(self.mood[i]).tag(i)
                        }
                                            
                     }
                     .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    
                    ColorPicker("你心情的顏色", selection: $bgColor)
                    Text("這個顏色")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(bgColor)
                    
                }
                Section{
                    DatePicker("現在的時間", selection: $selectTime)
                    HStack{
                        
                        Text("原來今天是")
                        
                        Text(selectTime, style: .date)
                        Text(selectTime, style: .time)
                        
                        Text("本熊過太爽，差點忘了今天幾號。")
                    }
                }
                DisclosureGroup(isExpanded: $isExpanded) {
                    VStack(alignment: .leading) {
                        ForEach(methods, id: \.self) { method in
                            Text(method)
                        }
                    }
                } label: {
                    Label("對了，要問我問題可以，也要記得幫我做下面這些事喔", systemImage: "heart.circle")
                }
                .padding()
            }
            Button(action: {
                showSecondView = true
                adviceIndex = Int.random(in: 0...2)
            }, label: {
                Text("OK，熊熊精靈給我建議")
                    .font(.largeTitle)
            }).fullScreenCover(isPresented: self.$showSecondView, content:{
                SecondView(moodIndex: $pickIndex, name: $name, adviceIndex: $adviceIndex)
            })
            
        }
        
    }
}

//struct SetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetView()
//    }
//}
