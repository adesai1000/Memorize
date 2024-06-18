//
//  ContentView.swift
//  Memorize
//
//  Created by Ayush Desai on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> =  ["🍌","🥑","🍒","🍑","🍇"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index]);
            }
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)}
            else{
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
