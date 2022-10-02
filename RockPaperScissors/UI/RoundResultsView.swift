//
//  RoundResultsView.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import SwiftUI

struct RoundResultsView: View {
  let results: [RoundResult]
  
  var body: some View {
    List(results) { result in
      HStack {
        Text(result.round.description)
          .foregroundColor(.secondary)
        Text(result.winner)
      }
      .listRowBackground(Color.clear)
    }
    .listStyle(.plain)
    .scrollContentBackground(.hidden)
  }
}


struct RoundResultsView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.mint.opacity(0.5)
        .ignoresSafeArea()
      VStack {
        Text("Results")
        
        RoundResultsView(
          results: [
            RoundResult(round: 1, winner: "Computer"),
            RoundResult(round: 2, winner: "Player"),
            RoundResult(round: 3, winner: "Player"),
            RoundResult(round: 4, winner: "Computer"),
            RoundResult(round: 5, winner: "Computer"),
          ]
        )
      }
      .padding(.horizontal)
    }
  }
}
