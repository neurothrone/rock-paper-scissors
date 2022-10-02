//
//  ScoreTextView.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import SwiftUI

struct ScoreTextView: View {
  let computerScore: Int
  let playerScore: Int
  
  var body: some View {
    HStack {
      Text("Computer: \(computerScore)")
      Spacer()
      Text("Player: \(playerScore)")
    }
    .padding()
  }
}

struct ScoreTextView_Previews: PreviewProvider {
  static var previews: some View {
    ScoreTextView(computerScore: 2, playerScore: 3)
  }
}
