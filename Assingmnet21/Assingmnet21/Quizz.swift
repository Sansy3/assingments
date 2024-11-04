//
//  Quizz.swift
//  Assingmnet21
//
//  Created by beqa on 03.11.24.
//

import UIKit



class Quizz: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
    
    private func setupUI() {
        setupTableView()
        setupImage()
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
           tableView.backgroundColor = .blue
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuizzCell", for: indexPath) as? QuizzCell else {
                    fatalError("Could not dequeue QuizzCell")
        }
                
        let question = quizQuestions[indexPath.row]
        cell.Numberlabel.text = "Question \(question.questionNumber)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedQuestion = quizQuestions[indexPath.row]
            let detailsVC = DetailsViewController()
            detailsVC.question = selectedQuestion
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    
    
    
}
#Preview {
    Quizz()
}
