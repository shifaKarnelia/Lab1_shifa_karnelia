//
//  ContentView.swift
//  Lab1_shifa_karnelia
//
//  Created by Shifa Karnelia on 2026-02-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentNumber: Int = Int.random(in: 2...100)
    @State private var feedback: Feedback = .none
    enum Feedback {
            case none
            case correct
            case wrong
        }
    var body: some View {
        
        //print number
        Text(" \(currentNumber)")
            .font(.system(size: 64, weight: .semibold, design: .serif))
            .foregroundColor(.teal)

        //prime , not prime labe
        VStack(spacing: 18) {
                           Text("Prime")
                            Text("Not Prime")
                       }

        EmptyView().frame(height: 80)
        Image(systemName: "checkmark.circle.fill")
            .font(.system(size: 72))
            .foregroundColor(.green)
            .frame(height: 80)
                            
        Image(systemName: "xmark.circle.fill")
            .font(.system(size: 72))
            .foregroundColor(.red)
            .frame(height: 80)
    }
}

#Preview {
    ContentView()
}
