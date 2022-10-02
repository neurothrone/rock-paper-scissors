//
//  Hand.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import SwiftUI

enum Hand: String {
  case rock = "🪨"
  case paper = "📄"
  case scissor = "✂️"
}

extension Hand: Identifiable, CaseIterable {
  var id: Self { self }
  
  static var random: Hand {
    Self.allCases.randomElement() ?? .rock
  }
  
  func winsOver(otherHand: Hand) -> Bool? {
    guard self != otherHand else { return nil }
    
    switch self {
    case .rock:
      return otherHand == .scissor ? true : false
    case .paper:
      return otherHand == .rock ? true : false
    case .scissor:
      return otherHand == .paper ? true : false
    }
  }
}
