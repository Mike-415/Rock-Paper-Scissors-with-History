
import Foundation

enum RPSMove {
    case rock, paper, scissors
}

class RPSGame {
    
    private var playerMove:RPSMove?
    private var scores = [String]()
    
    func setPlayerMove(to move:RPSMove) {
        playerMove = move
    }
    func getScores() -> [String] {
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
    
    // Emojis: 👊 , ✋ , ✌️
    
    private func rockResults(computerMove:RPSMove) -> String {
        if computerMove == .paper {
            scores.append("👊 vs ✋: You lost")
            return "👊 vs ✋\n\nYou lose\n😔"
        } else if computerMove == .scissors {
            scores.append("👊 vs ✌️: You won")
            return "👊 vs ✌️\n\nYou win!!\n🤩"
        } else {
            scores.append("👊 vs 👊: Tied game")
            return "👊 vs 👊\n\nTied game\n😐"
        }
    }
    
    private func paperResults(computerMove:RPSMove) -> String {
        if computerMove == .scissors {
            scores.append("✋ vs ✌️: You lost")
            return "✋ vs ✌️\n\nYou lose\n😔"
        } else if computerMove == .rock {
            scores.append("✋ vs 👊: You won")
            return "✋ vs 👊\n\nYou win!!\n🤩"
        } else {
            scores.append("✋ vs ✋: Tied game")
            return "✋ vs ✋\n\nTied game\n😐"
        }
    }
    //scores.append("")
    private func scissorsResults(computerMove:RPSMove) -> String
    {
        if computerMove == .rock {
            scores.append("✌️ vs 👊: You lost")
            return "✌️ vs 👊\n\nYou lose\n😔"
        } else if computerMove == .paper {
            scores.append("✌️ vs ✋: You won")
            return "✌️ vs ✋\n\nYou win!!\n🤩"
        } else {
            scores.append("✌️ vs ✌️: Tied game")
            return "✌️ vs ✌️\n\nTied game\n😐"
        }
    }
    
    func gameResult() -> String
    {
        let computerMove = generateRandomMove()
        var results = ""
        switch playerMove {
        case .rock?:
            results += rockResults(computerMove: computerMove)
        case .paper?:
            results += paperResults(computerMove: computerMove)
        case .scissors?:
            results += scissorsResults(computerMove: computerMove)
        default:
            break
        }
        return results
    }
}

var rpsGame = RPSGame()

