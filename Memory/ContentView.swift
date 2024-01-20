//
//  ContentView.swift
//  Memory
//
//  Created by Arii on 2024-01-10.
//

import SwiftUI

struct ContentView: View {
    let emojis : Array<String> = ["🦋", "🐶", "😼", "🐍","🦋", "🐶", "😼", "🐍",]
    @State var cardCount : Int = 4;
    
    var body: some View {
        VStack{
            ScrollView{
                cardDisplay
            }
                Spacer()
                cardAdjuster
        }.padding()
    }
    
    var cardDisplay : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
            }.aspectRatio(2/3,contentMode: .fit)
        }.foregroundColor(.blue)
    }
    
    var cardAdjuster : some View{
        HStack{
            addCard
            Spacer()
            removeCard
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardAddMinus(by offset: Int, symbol: String) -> some View{
        Button(action: {
                cardCount += offset;
            }
        ,label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var addCard : some View{
        cardAddMinus(by: +1, symbol: "rectangle.stack.badge.plus")
    }
    
    var removeCard : some View{
        cardAddMinus(by: -1, symbol: "rectangle.stack.badge.minus")
    }
}


struct CardView: View{
    @State var isTouched = true //type inference we dont have to specify the type
    let content : String
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 10) //type inference as roundedrectangle is a type of base that we didnt explicitly defined, swift does that for us
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isTouched ? 0 : 1)
            base.fill().opacity(isTouched ? 1 : 0)
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
