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
    @State private var userAnsweredThisRound: Bool = false
    
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
                .font(.system(size: 34))
                .padding()
                .contentShape(Rectangle())
                .onTapGesture {print("prime tapped")
                }
                    
                Text("Not Prime")
                .font(.system(size: 34))
                .padding()
                .contentShape(Rectangle())
                .onTapGesture {print("not prime tapped")
                }
                  

              
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
    //function that
    //check if number is prime or not
    private func isPrime(_ n: Int) -> Bool {
            if n < 2 { return false }
            if n == 2 { return true }
            if n % 2 == 0 { return false }

            let limit = Int(Double(n).squareRoot())
            if limit < 3 { return true }

            var i = 3
            while i <= limit {
                if n % i == 0 { return false }
                i += 2
            }
            return true
    }
}

#Preview {
    ContentView()
}
