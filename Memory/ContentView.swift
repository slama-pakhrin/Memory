//
//  ContentView.swift
//  Memory
//
//  Created by Arii on 2024-01-10.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
            .foregroundColor(.blue)
            .padding()
        
    }
}


struct CardView: View{
    @State var isTouched = false //type inference we dont have to specify the type
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 10) //type inference as roundedrectangle is a type of base that we didnt explicitly defined, swift does that for us
            if(isTouched){
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👽").font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
        .onTapGesture { //this is a closure. trailing closure. last argument or only one argument to work. This is like a struct (ZStack) and this onTAPGesture is inline function exactly a closure
//            isTouched = !isTouched can be done as
            isTouched.toggle() //bool is a function in swift
            
        }
    }
}





#Preview {
    ContentView()
}
