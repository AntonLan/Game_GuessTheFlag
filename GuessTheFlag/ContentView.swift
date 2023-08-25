//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Anton Gerasimov on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shovingScore = false
    @State private var finalResult = false
    @State private var scoreTitle = ""
    @State private var scoreCount = 0
    @State private var questionCount = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Gues the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack() {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(scoreCount)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $shovingScore) {
            Button("Continue", action: askQuestion)
        }  message: {
            Text("You score is \(scoreCount)")
        }
        .alert("Congratulation", isPresented: $finalResult) {
            Button("Reset", action: resetGame)
        }  message: {
            Text("You final score = \(scoreCount)")
        }
    }
    
    func flagTapped(_ number: Int) {
        questionCount += 1
        if questionCount == 8 {
            finalResult = true
            return
        }
        
        shovingScore = true
        
        if number != correctAnswer {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            scoreCount -= 1
            if scoreCount < 0 {scoreCount = 0}
            return
        }
        
        scoreTitle = "Correct"
        scoreCount += 1
        
      
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount = 0
        scoreCount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
