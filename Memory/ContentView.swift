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
            CardView(isTouched: true)
            CardView()
            CardView()
            CardView()
        }
            .foregroundColor(.blue)
            .padding()
        
    }
}


struct CardView: View{
    var isTouched : Bool = false
    var body: some View{
        if(isTouched){
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 2)
                Text("👽").font(.largeTitle)
            }
        } else {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
            }
        }

    }
}





#Preview {
    ContentView()
}
