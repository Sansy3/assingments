import UIKit
class DetailsViewController: UIViewController {
    
    var question: QuizQuestion?
    private var answerLabels: [UILabel] = []
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    private let QuestionNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.clipsToBounds = true
        label.layer.cornerRadius = 12



        return label
        
    }()

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        displayQuestion()
        displayAnswers()
        displayQuestionNum()
        
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(questionLabel)
        view.addSubview(QuestionNumberLabel)
        
        for _ in 0..<4 {
            let answerLabel = UILabel()
            answerLabel.backgroundColor = .systemBlue
            answerLabel.textColor = .white
            answerLabel.textAlignment = .center
            answerLabel.layer.cornerRadius = 12
            answerLabel.clipsToBounds = true
            answerLabel.frame.size = CGSize(width: 300, height: 49)
            answerLabels.append(answerLabel)
            stackView.addArrangedSubview(answerLabel)
        }
        
        
        NSLayoutConstraint.activate([
            QuestionNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -16),
                    questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            QuestionNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -16),
            QuestionNumberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        

        for label1 in answerLabels {
            NSLayoutConstraint.activate([
                label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                label1.heightAnchor.constraint(equalToConstant: 49)
            ])

    }
    
}
    
    private func displayQuestionNum() {
        guard let question = question else { return }
        QuestionNumberLabel.text = "Question \(question.questionNumber)"
    }

    
    private func displayQuestion() {
        guard let question = question else { return }
        questionLabel.text = question.question
        }
    
    private func displayAnswers() {
        guard let question = question else { return }
        let allansw = [question.correct_answer] + question.incorrect_answers
        let shuffled = allansw.shuffled().prefix(4)
        for (index, answer) in shuffled.enumerated() {
        answerLabels[index].text = answer
        }
    }
    
    
    }



#Preview {
    DetailsViewController()
}


