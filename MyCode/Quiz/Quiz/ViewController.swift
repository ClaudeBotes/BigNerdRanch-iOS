//
//  Copyright © 2015 Big Nerd Ranch
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    
    // Constraints
    
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var answerLabel: UILabel!
    
    // MARK: Properties
    
    var numberOfQuestions: Int {
        get{
            return questions.count
        }
    }
    
    // MARK: Variables
    
    let questions: [String] = [
        "From what is cognac made?",
        "What is 7+7?",
        "What is the capital of Vermont?"
    ]
    let answers: [String] = [
        "Grapes",
        "14",
        "Montpelier"
    ]
    var currentQuestionIndex: Int = 0
    
    // MARK: Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentQuestionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }
    
    // MARK: IB Actions
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == numberOfQuestions {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        animateLabelTransition()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    // MARK: Functions
    
    func animateLabelTransition(){
        
        view.layoutIfNeeded()
        
        // Animate the alpha and the center X constraints
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
                            self.currentQuestionLabel.alpha = 0
                            self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
                        },
                       completion: {_ in
                            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
        })
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    


}

