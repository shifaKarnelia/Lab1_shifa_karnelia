//
//  ContentView.swift
//  Lab1_shifa_karnelia
//
//  Created by Shifa Karnelia on 2026-02-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentNumber: Int = Int.random(in: 2...100)
    var body: some View {
        
        //print number
        Text(" \(currentNumber)")
        //prime , not prime labe
        VStack(spacing: 18) {
                           Text("Prime")
                            Text("Not Prime")
                       }

            
    }
}

#Preview {
    ContentView()
}
