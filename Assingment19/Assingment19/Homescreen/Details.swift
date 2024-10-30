//
//  DetailsVC.swift
//  Assingment19
//
//  Created by beqa on 30.10.24.
//
import Foundation
import UIKit


class DetailsVc: UIViewController {
    
    private let titleLabel = UILabel()
    private let publishedAtLabel = UILabel()
    private let contentLabel = UILabel()
    private let newsImageView = UIImageView()
    private let authorLable = UILabel()
    
    var article: NewsArticle?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hot Updates"
        setupUI()
        configureView()
    }
    private func setupUI() {
         view.backgroundColor = .white
         
         titleLabel.font = UIFont(name: "Nunito-Regular", size: 16)
         titleLabel.numberOfLines = 0
         view.addSubview(titleLabel)
         
         publishedAtLabel.font = UIFont(name: "Nunito-Regular", size: 12)
         publishedAtLabel.textColor = .gray
        view.addSubview(publishedAtLabel)

         
         newsImageView.contentMode = .scaleAspectFill
         newsImageView.clipsToBounds = true
        view.addSubview(newsImageView)
        
        contentLabel.font = UIFont(name: "Nunito-Regular", size: 14)
        contentLabel.numberOfLines = 0
        view.addSubview(contentLabel)
        
        authorLable.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(authorLable)


         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         publishedAtLabel.translatesAutoresizingMaskIntoConstraints = false
         contentLabel.translatesAutoresizingMaskIntoConstraints = false
         newsImageView.translatesAutoresizingMaskIntoConstraints = false
         authorLable.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
             titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

             publishedAtLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
             publishedAtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             publishedAtLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
             newsImageView.topAnchor.constraint(equalTo: publishedAtLabel.bottomAnchor, constant: 8),
                newsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                newsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                newsImageView.heightAnchor.constraint(equalToConstant: 144
                                                     ),
            contentLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
             
             authorLable.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
             authorLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             authorLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
             
             

         ])
     }
     
    
    private func configureView() {
        guard let article = article else { return }
        
        titleLabel.text = article.title
        publishedAtLabel.text = "Sunday, 9 May 2021"
        contentLabel.text = article.content
        authorLable.text = "published by \(String(describing: article.author))"
        
        if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
            loadImage(from: url)
        } else {
            newsImageView.image = UIImage(systemName: "photo")
        }
    }
  

    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.newsImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}



#Preview() {
    UINavigationController(rootViewController:DetailsVc())
}
