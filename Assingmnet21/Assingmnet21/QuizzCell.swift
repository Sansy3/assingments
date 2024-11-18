import UIKit

class QuizzCell: UITableViewCell {
    
     let View = UIView()
     var Numberlabel = UILabel()
     let quizzImage = UIImage()
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        SetupView()
        SetupLabel()
    }
    
    private func SetupView() {
        contentView.addSubview(View)
        View.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            View.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            View.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            View.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            View.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            View.heightAnchor.constraint(equalToConstant: 45)
        ])
        View.backgroundColor = .white
        View.layer.cornerRadius = 12
    }
 
    
    
    
    private func SetupLabel() {
        View.addSubview(Numberlabel)
        Numberlabel.font = UIFont(name: "Sen", size: 16)
        Numberlabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Numberlabel.centerXAnchor.constraint(equalTo: View.centerXAnchor),
            Numberlabel.centerYAnchor.constraint(equalTo: View.centerYAnchor)
        ])
        
    }
    

}

#Preview {
    QuizzCell()
}
