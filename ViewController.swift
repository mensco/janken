
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var init_main_label: UIImageView!
    let rockImage = UIImage(named: "janken_gu")
    let scissorsImage = UIImage(named: "janken_choki")
    let paperImage = UIImage(named: "janken_pa")
        
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var winCountLabel: UILabel!
    @IBOutlet weak var loseCountLabel: UILabel!
    
    var winCount: Int = 0
    var loseCount: Int = 0
    
    // defnition of enemy action list
    var enemyAction: [String] = ["rock","scissors","paper"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func randomEnemyAction() -> String {
        let randomAction = enemyAction.randomElement()! // list must not be empty so unwrap forcibly
        return randomAction
    }
    
    func displayWinCount(){
        winCount = winCount + 1
        winCountLabel.text = "Win:" + winCount.description // int to string
    }
    func displayLoseCount(){
        loseCount = loseCount + 1
        loseCountLabel.text = "Lose:" + loseCount.description // int to string
    }
    
    func displayEnemyImage(enemyAction:String){
        switch enemyAction{
        case "rock":
            init_main_label.image = rockImage
        case "scissors":
            init_main_label.image = scissorsImage
        case "paper":
            init_main_label.image = paperImage
        default:
            print("error: enemyAction is inappropriate value")
        }
    }
        
    @IBAction func rockTapped(_ sender: Any) {
        let myAction = "rock"
        let enemyAction = randomEnemyAction()
        resultLabel.text = judgement(enemyAction: enemyAction, myAction: myAction)
        enemyLabel.text = enemyAction
        displayEnemyImage(enemyAction: enemyAction)
    }
    @IBAction func scissorsTapped(_ sender: Any) {
        let myAction = "scissors"
        let enemyAction = randomEnemyAction()
        resultLabel.text = judgement(enemyAction: enemyAction, myAction: myAction)
        enemyLabel.text = enemyAction
        displayEnemyImage(enemyAction: enemyAction)
    }
    
    @IBAction func paperTapped(_ sender: Any) {
        let myAction = "paper"
        let enemyAction = randomEnemyAction()
        resultLabel.text = judgement(enemyAction: enemyAction, myAction: myAction)
        enemyLabel.text = enemyAction
        displayEnemyImage(enemyAction: enemyAction)
    }
    
    func judgement(enemyAction: String, myAction: String) ->
        String{
        switch enemyAction {
        case "rock":
            switch myAction {
            case "rock":
                return "Draw"
            case "scissors":
                displayLoseCount()
                return "You Lose"
            case "paper":
                displayWinCount()
                return "You Win!"
            default:
                return "error: myAction is inappropriate value"
            }
        case "scissors":
            switch myAction {
            case "rock":
                displayWinCount()
                return "You Win!"
            case "scissors":
                return "Draw"
            case "paper":
                displayLoseCount()
                return "You Lose!"
            default:
                return "error: myAction is inappropriate value"
                }
        case "paper":
            switch myAction{
            case "rock":
                displayLoseCount()
                return "You Lose!"
            case "scissors":
                displayWinCount()
                return "You Win!"
            case "paper":
                return "Draw"
            default:
                return "error: myAction is inappropriate value"
            }
        default:
            return "error: enemyACtion is inappropriate value"
        }
    }
    
    
}

