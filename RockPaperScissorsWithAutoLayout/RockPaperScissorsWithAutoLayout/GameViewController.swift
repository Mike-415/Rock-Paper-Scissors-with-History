//
//  GameViewController.swift
//  RockPaperScissorsWithAutoLayout
//
//  Created by Michael Gonzalez on 4/8/18.
//  Copyright © 2018 App. All rights reserved.
//

import UIKit

class GameViewController: UIViewController
{

    
    @IBOutlet weak var gameResultsLabel: UILabel!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var tieLabel: UILabel!
    
    @IBOutlet weak var lossLabel: UILabel!
    
    private var moveChoices = [RPSMove.rock,.paper,.scissors]
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction private func pressButton(_ sender: UIButton) {
        if let buttonNumber = buttons.index(of: sender) {
            print("Button: ", buttonNumber)
            let rpsGame = RPSGame()
            rpsGame.setPlayerMove(to:moveChoices[buttonNumber])
            let results = RPSGame.getAllGameResults()
            print("Win: \(results.win) \nTie: \(results.tie) \nLoss: \(results.loss)")
            gameResultsLabel.text = rpsGame.getResults()
            updateLatestGameResults(win: results.win, tie: results.tie, loss: results.loss)

        }
    }
    private func updateLatestGameResults(win:Int, tie:Int, loss:Int)
    {
        winLabel!.text = "Win: \(win)"
        tieLabel!.text = "Tie: \(tie)"
        lossLabel!.text = "Loss: \(loss)"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            buttonStackView.axis = .horizontal
        } else {
            buttonStackView.axis = .vertical
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}
