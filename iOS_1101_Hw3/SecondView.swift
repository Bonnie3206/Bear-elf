//
//  SecondView.swift
//  iOS_1101_Hw3
//
//  Created by CK on 2021/12/14.
//

import SwiftUI

struct SecondView: View {
    @Binding var moodIndex :Int
    @Binding var name :String
    @Binding var adviceIndex : Int
    @State private var alertTitle = ""
    @State private var showAlert = false
    @State private var showContentView = false
    
    var mood = ["開心","難過","放鬆"]
    var advice = ["出去走走啊，懶人。","聽聽歌吧，本熊最喜歡搖滾樂了","跟朋友分享，啊不對你沒朋友。"]
    
    var body: some View {
        VStack{
            Text("安安！\(name)")
                .font(.largeTitle)
            Image("Bear\(Int.random(in: 1...3))")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
            Text("你現在很\(mood[moodIndex])呀？")
                .font(.largeTitle)
            Text("讓我給你一點建議吧")
                .font(.largeTitle)
            Text("熊精靈的建議：")
                .font(.largeTitle)
                .offset(x:0,y:30)
            Text("\(advice[adviceIndex])")
                .font(.largeTitle)
                .background(Color(.gray))
                .offset(x:0,y:40)
            Button(action: {
                showAlert = true
            }, label: {
                Text("了解")
                    .font(.largeTitle)
            }).alert(isPresented: $showAlert) { () -> Alert in
                
                return Alert(title: Text("這個建議有用嗎？"), message: Text("有用的話記得你剛剛答應我的事喔"), dismissButton: .default(Text("很實用..."), action: {
                    showContentView = true
                 }))
             }.offset(x:0,y:50)
        }
        .fullScreenCover(isPresented: self.$showContentView, content:{
            ContentView()
        })
    }
}
//
//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
