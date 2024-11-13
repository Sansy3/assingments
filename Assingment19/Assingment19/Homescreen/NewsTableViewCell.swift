import UIKit

class NewsTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let dateLabel = UILabel()
    private let newsImageView = UIImageView()

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
        
        titleLabel.font = UIFont(name: "Nunito-Regular", size: 16)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
        
        authorLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        authorLabel.textColor = .white
        contentView.addSubview(authorLabel)
        
        dateLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        dateLabel.textColor = .white
        contentView.addSubview(dateLabel)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with article: NewsArticle, formattedDate: String) {
            titleLabel.text = article.title
            authorLabel.text = "By \(article.author ?? "Unknown")"
            dateLabel.text = formattedDate 
            
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
