//
//  ViewController.swift
//  MyApp3
//
//  Created by User11 on 2018/11/28.
//  Copyright © 2018 pur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet var AnswerButton: [UIButton]!
    @IBOutlet weak var QuestionText: UILabel!
    @IBOutlet weak var RightText: UILabel!
    @IBOutlet weak var ScoreText: UILabel!
    @IBOutlet weak var PlayAgainButton: UIButton!
    @IBOutlet weak var EvaluationText1: UILabel!
    @IBOutlet weak var EvaluationText2: UILabel!
    
    var RandomQNumber = 0
    var Score = 0
    var PlayTime = -1
    @IBAction func Button1Click(_ : UIButton) {
        checkAnswer(answerSelect: 1)
    }
    @IBAction func Button2Click(_ : UIButton) {
        checkAnswer(answerSelect: 2)
    }
    @IBAction func Button3Click(_ : UIButton) {
        checkAnswer(answerSelect: 3)
    }
    @IBAction func Button4Click(_ : UIButton) {
        checkAnswer(answerSelect: 4)
    }
    
    @IBAction func NextButtonClick(_: UIButton) {
        PlayTime += 1
        if(PlayTime < 10){
            setNewQuestion()
        }
        else{
            RightText.text = "結束(￣▽￣)/"
            PlayAgainButton.isHidden = false
            NextButton.isHidden = true
            Evaluate()
        }
    }
    
    func Evaluate(){
        EvaluationText1.isHidden = false
        EvaluationText2.isHidden = false

        var text1 = ""
        var text2 = ""
        if(Score == 0){
            text1 = "全錯也是個才能"
            text2 = "(|||ﾟдﾟ)"
        }
        else if(Score < 30){
            text1 = "要不要再試一次"
            text2 = "(つд⊂)"
        }
        else if(Score < 60){
            text1 = "目標是６０分"
            text2 = "(　ﾟ∀ﾟ) ﾉ"
        }
        else if(Score < 100){
            text1 = "好厲害喔"
            text2 = "(*ﾟ∀ﾟ*)"
        }
        else if(Score == 100){
            text1 = "太神了!滿分"
            text2 = "(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧"
        }
        EvaluationText1.text = text1
        EvaluationText2.text = text2

    }
    func checkAnswer(answerSelect: Int){
        let realAnswer = qBank[RandomQNumber].correct
        if(answerSelect == realAnswer){
            RightText.text = "正確(Ｏ∀Ｏ)"
            ScoreUP()
        }else{
            RightText.text = "錯了(TＡT)"
        }
        NextButton.isHidden = false
        RightText.isHidden = false
        for i in 0...3{
            AnswerButton[i].isEnabled = false
        }
    }
    
    func ScoreUP(){
        Score += 10
        ScoreText.text = String(Score)
    }
    @IBAction func playAgainButton(_ sender: UIButton) {
        Score = 0
        ScoreText.text = String(Score)
        PlayTime = 0
        PlayAgainButton.isHidden = true
        NextButton.isHidden = false
        EvaluationText1.isHidden = true
        EvaluationText2.isHidden = true
        setNewQuestion()
    }
    
    func setNewQuestion(){
        RandomQNumber = Int.random(in: 0...21)
        let test = qBank[RandomQNumber]
        QuestionText.text = test.question
        AnswerButton[0].setTitle(test.answer1,for:.normal)
        AnswerButton[1].setTitle(test.answer2,for:.normal)
        AnswerButton[2].setTitle(test.answer3,for:.normal)
        AnswerButton[3].setTitle(test.answer4,for:.normal)
        NextButton.setTitle("下一題",for:.normal)
        
        NextButton.isHidden = true
        RightText.isHidden = true
        
        for i in 0...3{
            AnswerButton[i].isHidden = false
            AnswerButton[i].isEnabled = true
        }
    }
    
    var qBank = [
                ＱuestionBank(question: "Pe + ter =", answer1: "Peter",
                                answer2: "terPe", answer3: "Pe+ter", answer4: "What?",correct: 1),
                
                ＱuestionBank(question: "1 + 1 =", answer1: "1",
                                answer2: "2", answer3: "3", answer4: "4",correct: 2),
                ＱuestionBank(question: "37 + 54 =", answer1: "81",
                               answer2: "91", answer3: "90", answer4:"83",correct: 2),
                ＱuestionBank(question: "21 + 14 =", answer1: "36",
                               answer2: "7", answer3: "34", answer4: "35",correct: 4),
                ＱuestionBank(question: "58 + 59 =", answer1: "118",
                               answer2: "107", answer3: "117", answer4:"109",correct: 3),
                ＱuestionBank(question: "124 + 137 =", answer1: "261",
                                answer2: "251", answer3: "271", answer4: "241",correct: 1),
                
                ＱuestionBank(question: "8 - 7 =", answer1: "0",
                               answer2: "1", answer3: "2", answer4: "3",correct: 2),
                ＱuestionBank(question: "86 - 49 =", answer1: "37",
                               answer2: "36", answer3: "47", answer4: "38",correct: 1),
                ＱuestionBank(question: "71 - 62 =", answer1: "0",
                               answer2: "1", answer3: "11", answer4: "21",correct: 3),
                ＱuestionBank(question: "81 - 28 =", answer1: "43",
                               answer2: "33", answer3: "63", answer4: "53",correct: 4),
                ＱuestionBank(question: "831 - 528 =", answer1: "303",
                               answer2: "309", answer3: "293", answer4: "294",correct: 1),
                
                ＱuestionBank(question: "0 * 233 =", answer1: "0",
                               answer2: "1", answer3: "2", answer4: "233",correct: 1),
                ＱuestionBank(question: "13 * 7 =", answer1: "84",
                               answer2: "91", answer3: "92", answer4: "93",correct: 2),
                ＱuestionBank(question: "4 * 23 =", answer1: "81",
                               answer2: "82", answer3: "92", answer4: "102",correct: 3),
                ＱuestionBank(question: "26 * 8 =", answer1: "238",
                               answer2: "228", answer3: "218", answer4: "208",correct: 4),
                ＱuestionBank(question: "45 * 71 =", answer1: "3045",
                               answer2: "3475", answer3: "2865", answer4: "3195",correct: 4),
                
                ＱuestionBank(question: "0 / 6 =", answer1: "2",
                               answer2: "1", answer3: "0", answer4: "-1",correct: 3),
                ＱuestionBank(question: "91 / 7 =", answer1: "13",
                               answer2: "12", answer3: "11", answer4: "10",correct: 4),
                ＱuestionBank(question: "65 / 5 =", answer1: "11",
                               answer2: "12", answer3: "13", answer4: "14",correct: 3),
                ＱuestionBank(question: "76 / 4 =", answer1: "16",
                               answer2: "19", answer3: "22", answer4: "24",correct: 2),
                ＱuestionBank(question: "867 / 17 =", answer1: "51",
                               answer2: "53", answer3: "61", answer4: "47",correct: 1),
                
                ＱuestionBank(question: "147 * 789", answer1: "你絕",
                               answer2: "不會", answer3: "答錯", answer4: "115983",correct: 4),
                
                ]
    
    class ＱuestionBank {
        var question = "No.?"
        var answer1 = "7"
        var answer2 = "8"
        var answer3 = "9"
        var answer4 = "10"
        var correct = 4
        
        init(question: String, answer1: String, answer2: String, answer3: String, answer4: String, correct: Int) {
            self.question = question
            self.answer1 = answer1
            self.answer2 = answer2
            self.answer3 = answer3
            self.answer4 = answer4
            self.correct = correct
        }
    }
}
