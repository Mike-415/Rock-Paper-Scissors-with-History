
import UIKit

class GameViewController: UIViewController
{
    private var moveChoices = [RPSMove.rock,.paper,.scissors]
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBAction func pressButton(_ sender: UIButton)
    {
        if let buttonNumber = buttons.index(of: sender)
        {
            print("Button pressed:  \(sender.index)")
            rpsGame.setPlayerMove(to:moveChoices[buttonNumber])
        }
        performSegue(withIdentifier: "ResultsSegue", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

/*
 
 import UIKit
 
 
 class ViewController: UIViewController {
 
 private var moveChoices = [RPSMove.rock,.paper,.scissors]
 
 @IBOutlet var buttons: [UIButton]!
 
 @IBAction func pressButton(_ sender: UIButton) {
 if let buttonNumber = buttons.index(of: sender) {
 rpsGame.setPlayerMove(to:moveChoices[buttonNumber])
 }
 performSegue(withIdentifier: "resultsSegue", sender: self)
 }
 
 override func viewDidLoad(){
 super.viewDidLoad()
 }
 }
 

 
 */
