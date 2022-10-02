//
//  Game.swift
//  RockPaperScissors
//
//  Created by Zaid Neurothrone on 2022-10-02.
//

import Foundation

struct Game {
  let maxRounds = 5
  
  private(set) var currentRound = 1
  private(set) var message = ""
  
  private(set) var computerScore = 0
  private(set) var playerScore = 0
  
  var isOver: Bool {
    currentRound > maxRounds
  }
  
  var winner: String {
    var message = ""
    if computerScore > playerScore {
      message += "Computer"
    } else if playerScore > computerScore {
      message += "Player"
    } else {
      message += "No one"
    }
    return message + " won the game."
  }
  
  mutating func playWith(hand playerHand: Hand) {
    let computerHand = Hand.random
    let winner = whoWonTheRound(computerHand, playerHand)
    
    if winner == .computer {
      computerScore += 1
    } else if winner == .player {
      playerScore += 1
    }
    
    message = "Computer chose \(computerHand.rawValue). Player chose \(playerHand.rawValue). \(winner.rawValue) won this round."
  }
  
  mutating func nextRound() {
    currentRound += 1
  }
  
  mutating func reset() {
    currentRound = 1
    computerScore = 0
    playerScore = 0
  }
  
  func whoWonTheRound(
    _ computerHand: Hand,
    _ playerHand: Hand
  ) -> Winner {
    guard let computerWins = computerHand.winsOver(otherHand: playerHand)
    else { return .noOne }
    
    return computerWins ? .computer : .player
  }
  
  func whoWonTheRoundPriorSolution(
    _ computerHand: Hand,
    _ playerHand: Hand
  ) -> Winner  {
    if computerHand == playerHand {
      return .noOne
    }
    
    if computerHand == .rock && playerHand == .scissor
        || computerHand == .paper && playerHand == .rock
        || computerHand == .scissor && playerHand == .paper {
      return .computer
    }
    
    return .player
  }
}
