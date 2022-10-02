//
//  RoundResult.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import Foundation

struct RoundResult: Identifiable {
  let id = UUID().uuidString
  
  let round: Int
  let winner: String
}
