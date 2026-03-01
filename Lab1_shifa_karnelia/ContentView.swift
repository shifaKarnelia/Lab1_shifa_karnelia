//
//  ContentView.swift
//  Lab1_shifa_karnelia
//
//  Created by Shifa Karnelia on 2026-02-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentNumber: Int = Int.random(in: 2...100)
    //feedback var
    @State private var feedback: Feedback = .none
    @State private var userAnsweredThisRound: Bool = false
    
    // total score count var
    @State private var totalCorrect: Int = 0
    @State private var totalWrong: Int = 0

    
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
        
        //prime , not prime label
        VStack(spacing: 18) {
            tappableChoice(title: "Prime", userChoicePrime: true)
            tappableChoice(title: "not Prime", userChoicePrime: false)
        }
        
        Group {
            switch feedback {
                case .none:
                    EmptyView()
                      .frame(height: 80)
                case .correct:
                    Image(systemName: "checkmark.circle.fill")
                       .font(.system(size: 72))
                        .foregroundColor(.green)
                        .frame(height: 80)
                case .wrong:
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 72))
                        .foregroundColor(.red)
                        .frame(height: 80)
                           }
                       }
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
    
    private func tappableChoice(title: String, userChoicePrime: Bool) -> some View {
        Text(title)
            .font(.system(size: 34, weight: .regular, design: .serif))
            .foregroundColor(.teal)
            .padding(.vertical, 6)
            .contentShape(Rectangle())
            .onTapGesture {
                guard !userAnsweredThisRound else { return }
                let actualPrime = isPrime(currentNumber)
                let userIsCorrect = (userChoicePrime == actualPrime)
                userAnsweredThisRound = true
                feedback = userIsCorrect ? .correct : .wrong
                recordAttempt(wasCorrect: userIsCorrect)
            }
    }
    //record attempt
    private func recordAttempt(wasCorrect: Bool) {
       
        if wasCorrect {
            totalCorrect += 1
           
        } else {
            totalWrong += 1
                    }
    }
    
    
}

#Preview {
    ContentView()
}
