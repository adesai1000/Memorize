//
//  ContentView.swift
//  Memorize
//
//  Created by Ayush Desai on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp:true);
            CardView();
            CardView();
            CardView();
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text("🥷🏻").font(.largeTitle)}
            else{
                base
            }
        }
    }
}


#Preview {
    ContentView()
}
