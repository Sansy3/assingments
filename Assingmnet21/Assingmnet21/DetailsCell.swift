

import UIKit

class DetailsCell: UITableViewCell {

    private let questionView = UIView()
    private let circleImage = UIImageView()
    private let answerLabel = UILabel()
    private let questionColor = UIColor(red: 142/255, green: 132/255, blue: 255/255, alpha: 1)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    private func setupUI() {
        
        
        contentView.addSubview(circleImage)
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        circleImage.image = UIImage(named: "circle")
        
        contentView.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.textColor = .black
        answerLabel.font = UIFont(name: "Sen", size: 16)

        NSLayoutConstraint.activate([
            
            
            circleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            circleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImage.heightAnchor.constraint(equalToConstant: 19),
            circleImage.widthAnchor.constraint(equalToConstant: 19),
            
            answerLabel.leadingAnchor.constraint(equalTo: circleImage.trailingAnchor, constant: 10),
            answerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
            
        ])
    }
    
    func configure(with answer: String) {
        
        answerLabel.text = answer
        resetImage()
    }
    
    func resetImage() {
        circleImage.image = UIImage(named: "circle")
        answerLabel.textColor = .black
        contentView.backgroundColor = .clear
    }
    
    func updateForCorrectAnswer() {
        circleImage.image = UIImage(named: "correctAnswer")
        contentView.backgroundColor = questionColor
    }
    
    func updateForIncorrectAnswer() {
        circleImage.image = UIImage(named: "incorrectAnswer")
        contentView.backgroundColor = questionColor
    }

}
