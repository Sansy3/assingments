//
//  NewsTableViewCell.swift
//  Assingment19
//
//  Created by beqa on 30.10.24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let dateLabel = UILabel()
    let sourceLabel = UILabel()
    let newsImageView = UIImageView()
    let overlayView = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.clipsToBounds = true
        contentView.addSubview(newsImageView)
        
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5) // Dark overlay
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(overlayView)
        
        titleLabel.font = UIFont(name: "Nunito-Regular", size: 16)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white //
        contentView.addSubview(titleLabel)
        
       
        
        authorLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        authorLabel.textColor = .white
        contentView.addSubview(authorLabel)
        
        dateLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        dateLabel.textColor = .white
        contentView.addSubview(dateLabel)
        

                
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 240),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        authorLabel.text = "By \(article.author ?? "Unknown")"
        dateLabel.text = "Sunday, 9 May 2021"
        
        if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
            loadImage(from: url)
        } else {
            newsImageView.image = UIImage(systemName: "photo")
        }
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            return outputFormatter.string(from: date)
        }
        return dateString
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
    
    
#Preview {
    return HomeScreenVC()
}
