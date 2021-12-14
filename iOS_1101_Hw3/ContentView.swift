//
//  ContentView.swift
//  iOS_1101_Hw3
//
//  Created by CK on 2021/12/1.
//愛的鼓勵小貓咪

import SwiftUI

struct ContentView: View {
    @State private var moodIndex = 0
    @State private var name = ""
    @State private var showSetView = false
    @State private var showContentView = false
    @State private var pickindex = 0
    var mood = ["開心","難過","放鬆"]

    var body: some View {
        VStack{
            Text("你好")
                .font(.largeTitle)
                .offset(x:0,y:-30)
            Text("我是愛講廢話的熊熊精靈")
                .font(.largeTitle)
            Image("Bear4")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                .clipShape(Circle())
            Text("今天有遇到什麼問題嗎？")
                .font(.largeTitle)
            Button(action: {
                showSetView = true
            }, label: {
                Text("讓熊熊精靈來解答吧")
                    .font(.largeTitle)
                    .offset(x:0,y:30)
                
            })
            
        }.sheet(isPresented: self.$showSetView) {
            SetView(showSetView: $showSetView)
        }
    }
}
struct Set: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
struct BirthdayView: View {
    @Binding var personalityIndex :Int
    @Binding var name :String
    var personality = ["活潑","文靜","暴躁"]

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
