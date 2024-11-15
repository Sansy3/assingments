
import UIKit



class Quizz: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    private let resetbutton = UIButton()
    let quizzImage = UIImageView()
    private var quizQuestions: [QuizQuestion] = []
    let dataLoader = QuizDataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupUI()
        quizQuestions = dataLoader.loadQuizData() ?? []
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        let color1 = UIColor(red: 43/255, green: 0/255, blue: 99/255, alpha: 1).cgColor
        let color2 = UIColor.black.cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.8)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    private func setupUI() {
        setupTableView()
        setupImage()
        setupbutt()
        setupdeletebuton()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(QuizzCell.self, forCellReuseIdentifier: "QuizzCell")
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        let color1 = UIColor(red: 43/255, green: 0/255, blue: 99/255, alpha: 1).cgColor
        let color2 = UIColor.black.cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.8)
        
        let gradientBackgroundView = UIView(frame: view.bounds)
        gradientBackgroundView.layer.addSublayer(gradientLayer)
        tableView.backgroundView = gradientBackgroundView
    }
    
    private func setupbutt() {
    view.addSubview(resetbutton)
    resetbutton.translatesAutoresizingMaskIntoConstraints = false
    resetbutton.setTitle("Reset", for: .normal)
    resetbutton.setTitleColor(.white, for: .normal)
    resetbutton.backgroundColor = UIColor(red: 142/255, green: 132/255, blue: 255/255, alpha: 1)
    resetbutton.layer.cornerRadius = 17
    resetbutton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            resetbutton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            resetbutton.centerYAnchor.constraint(equalTo: quizzImage.centerYAnchor),
            resetbutton.heightAnchor.constraint(equalToConstant: 34),
            resetbutton.widthAnchor.constraint(equalToConstant: 66),
                
        ])
        
     }
    
    private func setupImage() {
        view.addSubview(quizzImage)
        quizzImage.image = UIImage(named: "Quiz")
        quizzImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizzImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            quizzImage.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10),
            quizzImage.widthAnchor.constraint(equalToConstant: 53),
            quizzImage.heightAnchor.constraint(equalToConstant: 29)
                
        ])

        
        
    }
    
    
    private let DeleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Deletedata", for: .normal)
        button.backgroundColor = UIColor(red: 142/255, green: 132/255, blue: 255/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deletebuttonaction), for: .touchUpInside) 

        return button
    }()
    
    func setupdeletebuton() {
        view.addSubview(DeleteButton)
        DeleteButton.centerYAnchor.constraint(equalTo: quizzImage.centerYAnchor).isActive = true
        DeleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 155).isActive = true

    }
    

    
    @objc private func deletebuttonaction() {
        let keychainVC = KeychainManager()
        
        do {
            try keychainVC.deletePassword(service: "some service", account: "username")
            
            print("Password successfully deleted")
        } catch {
            print("Failed to delete password:", error)
        }
    }
    
    @objc private func resetButtonAction() {
        let keychainVC = KeychainManager()
        do {
            try keychainVC.reset(service: "com.example.Assignment21Quiz")
            print("eset successfully.")
            navigationController?.popViewController(animated: true)
        } catch {
            print("Failed to reset: \(error)")
        }
        UserDefaults.standard.set(0, forKey: "correctAnswerCount")
        UserDefaults.standard.set(0, forKey: "incorrectAnswerCount")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuizzCell", for: indexPath) as? QuizzCell else {
                    fatalError("Could not dequeue QuizzCell")
        }
                
        let question = quizQuestions[indexPath.row]
        cell.Numberlabel.text = "Question \(question.questionNumber)"
        cell.selectionStyle = .none

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedQuestion = quizQuestions[indexPath.row]
            let detailsVC = Details()
            detailsVC.question = selectedQuestion

            detailsVC.configure(with: indexPath.row + 1, with: selectedQuestion)
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    
    
    
}
#Preview {
    Quizz()
}
