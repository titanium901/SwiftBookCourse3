//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by Yury Popov on 08/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    var questions: [Question] = [
    Question(text: "Что вы предпочитаете?", type: .single, answer: [
        Answer(text: "Мясо", type: .messi),
        Answer(text: "Рыбу", type: .ronaldo),
        Answer(text: "Морковку", type: .vidal),
        Answer(text: "Капусту", type: .buffon)
        ]),
    Question(text: "Какие виды деятельности любите?", type: .multiple, answer: [
        Answer(text: "Плавать", type: .messi),
        Answer(text: "Спать", type: .ronaldo),
        Answer(text: "Прыгать", type: .vidal),
        Answer(text: "Кушать", type: .buffon)
        ]),
    Question(text: "Как вы относитесь к поездкам?", type: .range, answer: [
        Answer(text: "Ненавижу", type: .messi),
        Answer(text: "Не замечаю", type: .ronaldo),
        Answer(text: "Они меня нервируют", type: .vidal),
        Answer(text: "Обожаю", type: .buffon)
        ])
    
    ]
    
    var questionIndex = 0
    
    var answersChosen = [Answer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        let question = questions[questionIndex]
        questionLabel.text = question.text
        
        let answers = question.answer
        let progress = Float(questionIndex) / Float(questions.count)
        progressView.progress = progress

        switch question.type {
        case .single:
            updateSingleStack(using: answers)
        case .multiple:
            updateMultipleStack(using: answers)
        case .range:
            updateRangeStack(using: answers )
        }
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.answers = answersChosen
        }
    }
 
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButtons.forEach { $0.isHidden = true }
        for index in 0..<min(singleButtons.count, answers.count) {
            singleButtons[index].isHidden = false
            singleButtons[index].setTitle(answers[index].text, for: .normal)
        }
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multipleLabels.forEach { $0.superview!.isHidden = true }
        for index in 0..<min(multipleLabels.count, answers.count) {
            multipleLabels[index].superview!.isHidden = false
            multipleLabels[index].text = answers[index].text
        }
    }
    
    func updateRangeStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first!.text = answers.first!.text
        rangedLabels.last!.text = answers.last!.text
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answer
        let index = singleButtons.firstIndex(of: sender)!
        answersChosen.append(answers[index])
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed() {
        let answers = questions[questionIndex].answer
        
        for index in 0..<min(multipleLabels.count, answers.count) {
            let label = multipleLabels[index]
            let stackView = label.superview!
            let multiSwitch = stackView.subviews.last! as! UISwitch
            
            if multiSwitch.isOn {
                answersChosen.append(answers[index])
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let answers = questions[questionIndex].answer
        let index = Int(round(slider.value * Float(answers.count - 1)))
        answersChosen.append(answers[index])
        nextQuestion()
    }
}
