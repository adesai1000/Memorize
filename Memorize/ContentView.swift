//
//  ContentView.swift
//  Memorize
//
//  Created by Ayush Desai on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> =  ["🍌","🥑","🍒","🍑","🍇","🍊","🫐","🍓","🍐","🍍","🥭","🥝"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
// Detailed code of the Cards and CardCountAdjuster.
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(3/4, contentMode: .fit)
            }
        }.foregroundColor(.green)
    }
    var cardCountAdjusters: some View{
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.title)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String)-> some View{
        Button(action:{
            cardCount += offset
        },label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View{
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardRemover: some View{
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0:1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
