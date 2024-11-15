

import Foundation
import UIKit

class Details: UIViewController {
    
    private let viewModel = QuizDataLoader()
    private var answers: [String] = []
    private var correctAnswer: String = ""
    var question: QuizQuestion?
    
    private let ColorBlue = UIColor(red: 142/255, green: 132/255, blue: 255/255, alpha: 1)

    private lazy var questionScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let questionNumber = UILabel()
    private let questionLabel = UILabel()
    private let answersCounterLabel = UILabel()
    private var isAnswerSelected = false

    
    private lazy var answersTableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .clear
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialAnswerCounts()
        setupUI()
        updateAnswersCounterLabel()
        if let question = question {
                configure(with: Int(question.questionNumber) ?? 1, with: question)
            }
        applyGradientBackground()
        
    }
    
    
    private func setupUI() {
        
        view.addSubview(questionScroll)
        questionScroll.translatesAutoresizingMaskIntoConstraints = false
        
        questionScroll.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(answersTableView)
        answersTableView.translatesAutoresizingMaskIntoConstraints = false
        answersTableView.backgroundColor = .clear
        answersTableView.register(DetailsCell.self, forCellReuseIdentifier: "Answers_TableViewCell")

        contentView.addSubview(questionNumber)
        questionNumber.translatesAutoresizingMaskIntoConstraints = false
        questionNumber.font = UIFont(name: "Sen", size: 14)
        questionNumber.textColor = .white
        questionNumber.textAlignment = .center
        questionNumber.backgroundColor = ColorBlue
        questionNumber.layer.cornerRadius = 17
        questionNumber.clipsToBounds = true
        
        contentView.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont(name: "Sen", size: 20)
        questionLabel.textColor = .white
        questionLabel.textAlignment = .left
        questionLabel.backgroundColor = .clear
        questionLabel.numberOfLines = 0
        questionLabel.sizeToFit()
       
        
        
        contentView.addSubview(answersCounterLabel)
        answersCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        answersCounterLabel.textAlignment = .center
        answersCounterLabel.backgroundColor = ColorBlue
        answersCounterLabel.text = "Correct Answer "
        answersCounterLabel.layer.cornerRadius = 15
        answersCounterLabel.clipsToBounds = true
        answersCounterLabel.font = UIFont(name: "Sen", size: 14)

        
        
        NSLayoutConstraint.activate([
            
            questionScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionScroll.topAnchor.constraint(equalTo: view.topAnchor),
            questionScroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: questionScroll.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: questionScroll.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: questionScroll.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: questionScroll.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: questionScroll.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: questionScroll.heightAnchor),
            
            answersTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            answersTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            answersTableView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            answersTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            

            
            questionNumber.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            questionNumber.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 26),
            questionNumber.heightAnchor.constraint(equalToConstant: 34),
            questionNumber.widthAnchor.constraint(equalToConstant: 81),
            
            questionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -71),
            questionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            questionLabel.topAnchor.constraint(equalTo: questionNumber.bottomAnchor, constant: 25),
            
            answersCounterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            answersCounterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            answersCounterLabel.bottomAnchor.constraint(equalTo: answersTableView.bottomAnchor, constant: -150),
            answersCounterLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
    }
    
    func configure(with questionNum: Int, with question: QuizQuestion) {
        questionNumber.text = "Question \(questionNum)"
        questionLabel.text = question.question
        answers = question.incorrect_answers + [question.correct_answer]
        correctAnswer = question.correct_answer
        answers.shuffle()
        answersTableView.reloadData()
    }

    private func initialAnswerCounts() {
        if UserDefaults.standard.object(forKey: "correctAnswerCount") == nil {
            UserDefaults.standard.set(0, forKey: "correctAnswerCount")
        }
        if UserDefaults.standard.object(forKey: "incorrectAnswerCount") == nil {
            UserDefaults.standard.set(0, forKey: "incorrectAnswerCount")
        }
    }
    
    private func correctAnswerCount() {
        let currentCount = UserDefaults.standard.integer(forKey: "correctAnswerCount")
        UserDefaults.standard.set(currentCount + 1, forKey: "correctAnswerCount")
        updateAnswersCounterLabel()
    }

    private func incorrectAnswerCount() {
        let currentCount = UserDefaults.standard.integer(forKey: "incorrectAnswerCount")
        UserDefaults.standard.set(currentCount + 1, forKey: "incorrectAnswerCount")
        updateAnswersCounterLabel()
    }

    private func updateAnswersCounterLabel() {
        let correctCount = UserDefaults.standard.integer(forKey: "correctAnswerCount")
        let incorrectCount = UserDefaults.standard.integer(forKey: "incorrectAnswerCount")
        answersCounterLabel.text = "Correct Answer: \(correctCount) / Incorrect: \(incorrectCount)"
    }
    
}

extension Details: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Answers_TableViewCell", for: indexPath) as! DetailsCell
        cell.configure(with: answers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               if isAnswerSelected { return }
               isAnswerSelected = true
               let selectedAnswer = answers[indexPath.row]
               let cell = tableView.cellForRow(at: indexPath) as? DetailsCell
               
               if selectedAnswer == correctAnswer {
                   cell?.updateForCorrectAnswer()
                   correctAnswerCount()
               } else {
                   cell?.updateForIncorrectAnswer()
                   incorrectAnswerCount()
               }

               tableView.deselectRow(at: indexPath, animated: true)
    }

}
