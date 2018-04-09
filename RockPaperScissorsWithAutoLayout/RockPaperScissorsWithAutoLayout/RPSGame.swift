//
//  RPSGame.swift
//  RockPaperScissorsWithAutoLayout
//
//  Created by Michael Gonzalez on 4/8/18.
//  Copyright © 2018 App. All rights reserved.
//

import Foundation


import Foundation

enum RPSMove:Int {
    case rock = 0, paper, scissors
}

enum GameResult {
    case win, tie, lose
}

class RPSGame {
    
    private static var winCounter = 0
    private static var tieCounter = 0
    private static var lossCounter = 0
    private static var scores = [String]()
    private var resultsString = ""
    private var playerMove:RPSMove?{
        didSet{
            resultsString = computeResults()
        }
    }
    
    func getResults() -> String {
        return resultsString
    }
    
    static func incrementGameResults(of results:GameResult){
        switch results{
            
        case .win:
            winCounter += 1
        case .tie:
            tieCounter += 1
        case .lose:
            lossCounter += 1
        }
    }
    
    static func getAllGameResults() -> (win: Int, tie: Int, loss: Int)
    {
        return (winCounter, tieCounter, lossCounter)
    }
    
    func setPlayerMove(to move:RPSMove) {
        playerMove = move
    }
    
    static func getScores() -> [String] {
        return scores
    }
    
    private func generateRandomMove() -> RPSMove {
        let randomNumber = Int(arc4random_uniform(3))
        if randomNumber == 0 {
            return RPSMove.rock
        }
        else if randomNumber == 1 {
            return RPSMove.paper
        }
        else {
            return RPSMove.scissors
        }
    }
    
    private func rockResults(comparedTo computerMove:RPSMove) {
        switch computerMove {
        case .paper:
            RPSGame.incrementGameResults(of: .lose)
            RPSGame.scores.append("👊 vs ✋: You lose")
        case .scissors:
            RPSGame.incrementGameResults(of: .win)
            RPSGame.scores.append("👊 vs ✌️: You win")
        case .rock:
            RPSGame.incrementGameResults(of: .tie)
            RPSGame.scores.append("👊 vs 👊: Tied game")
        }
    }
    
    private func paperResults(comparedTo computerMove:RPSMove) {
        switch computerMove {
        case .scissors:
            RPSGame.incrementGameResults(of: .lose)
            RPSGame.scores.append("✋ vs ✌️: You lose")
        case .rock:
            RPSGame.incrementGameResults(of: .win)
            RPSGame.scores.append("✋ vs 👊: You win")
        case .paper:
            RPSGame.incrementGameResults(of: .tie)
            RPSGame.scores.append("✋ vs ✋: Tied game")
        }
    }
    
    private func scissorsResults(comparedTo computerMove:RPSMove)
    {
        switch computerMove {
        case .rock:
            RPSGame.incrementGameResults(of: .lose)
            RPSGame.scores.append("✌️ vs 👊: You lose")
        case .paper:
            RPSGame.incrementGameResults(of: .win)
            RPSGame.scores.append("✌️ vs ✋: You win")
        case .scissors:
            RPSGame.incrementGameResults(of: .tie)
            RPSGame.scores.append("✌️ vs ✌️: Tied game")
        }
    }
    
    private func computeResults() -> String
    {
        let computersChoice = generateRandomMove()
        switch playerMove {
        case .rock?:
            rockResults(comparedTo: computersChoice)
        case .paper?:
            paperResults(comparedTo: computersChoice)
        case .scissors?:
            scissorsResults(comparedTo: computersChoice)
        default:
            break
        }
        return RPSGame.scores[RPSGame.scores.count - 1]
    }
}




