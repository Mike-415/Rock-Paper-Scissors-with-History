
import UIKit

class ResultsViewController: UIViewController
{
    
    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resultsTextView.text = rpsGame.gameResult()
    }


}
