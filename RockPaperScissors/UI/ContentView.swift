//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import SwiftUI

struct ContentView: View {
  @State private var game = Game()
  @State private var playerHand: Hand = .rock
  
  @State private var isHasPlayedAlertPresented = false
  @State private var isCompletedGameAlertPresented = false
  
  @State private var roundResults: [RoundResult] = []
  
  init() {
    UISegmentedControl.appearance().selectedSegmentTintColor = .systemMint
    UISegmentedControl.appearance().backgroundColor = UIColor(Color.green.opacity(0.5))
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.mint.opacity(0.1)
          .ignoresSafeArea()
        
        content
          .alert("Game Over", isPresented: $isCompletedGameAlertPresented) {
            Button("Restart") {
              roundResults.removeAll()
              game.reset()
            }
          } message: {
            Text(game.winner)
          }
      }
      .navigationTitle("Rock paper Scissors")
    }
  }
  
  var content: some View {
    VStack(spacing: 10) {
      ScoreTextView(computerScore: game.computerScore, playerScore: game.playerScore)
      RoundTextView(currentRound: game.currentRound, maxRounds: game.maxRounds)
      
      Text("Choose your hand")
        .bold()
        .font(.title2)
      
      VStack {
        Picker("Choose your hand", selection: $playerHand) {
          ForEach(Hand.allCases) { Text($0.rawValue) }
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 30)
        
        Button {
          playRound()
        } label: {
          Text("Play")
            .bold()
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
        }
        .buttonStyle(.borderedProminent)
        .tint(.mint)
        .cornerRadius(10)
        .padding(.bottom, 20)
        
        if roundResults.isEmpty {
          Text("No results yet...")
        } else {
          RoundResultsView(results: roundResults)
        }
      }
      .padding(.horizontal)
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
  }
}

extension ContentView {
  private func playRound() {
    game.playWith(hand: playerHand)

    let roundResult = RoundResult(round: game.currentRound, winner: game.message)
    roundResults.append(roundResult)
    
    game.nextRound()
    
    if game.currentRound > 5 {
      isCompletedGameAlertPresented.toggle()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
