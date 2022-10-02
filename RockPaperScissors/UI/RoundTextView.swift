//
//  RoundTextView.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import SwiftUI

struct RoundTextView: View {
  let currentRound: Int
  let maxRounds: Int
  
  var body: some View {
    let currentRoundText = currentRound <= maxRounds
    ? currentRound.description
    : ((currentRound - 1) / maxRounds).description
    
    Text("Round: \(currentRoundText) / \(maxRounds) ")
      .font(.title3)
  }
}

struct RoundTextView_Previews: PreviewProvider {
  static var previews: some View {
    RoundTextView(currentRound: 1, maxRounds: 10)
  }
}
