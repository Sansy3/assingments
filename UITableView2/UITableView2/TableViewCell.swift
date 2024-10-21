//
//  TableViewCell.swift
//  UITableView2
//
//  Created by beqa on 17.10.24.
//

import UIKit


class TableViewCell: UITableViewCell {

    
    private let planetImageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let surfaceAreaLabel: UILabel = UILabel()
    private let icon = UIImageView()
    private let temperatureLabel = UILabel()
    private let massLabel = UILabel()
    private let areaLabel = UILabel()
    
    
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureImage()
        configureLabel()
        configureArea()
        configureButton()
        configureTemp()
        conifguremass()
        configureAreaforMars()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureImage () {
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(planetImageView)
        planetImageView.contentMode = .scaleAspectFit
        planetImageView.clipsToBounds = true
        planetImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        planetImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        planetImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        planetImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
    func configureLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 36)
        contentView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)
        

    }
    func configureButton() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)
        icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35).isActive = true
    }
    
   

    func configureArea(){
        surfaceAreaLabel.translatesAutoresizingMaskIntoConstraints = false
        surfaceAreaLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(surfaceAreaLabel)
        surfaceAreaLabel.textColor = .white
        surfaceAreaLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        surfaceAreaLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 20).isActive = true
        surfaceAreaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        surfaceAreaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100).isActive = true
    }
    

        func configureTemp() {
            temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
            temperatureLabel.font = UIFont.systemFont(ofSize: 18)
            contentView.addSubview(temperatureLabel)
            temperatureLabel.textColor = .white
            temperatureLabel.topAnchor.constraint(equalTo: surfaceAreaLabel.bottomAnchor, constant: 4).isActive = true
            temperatureLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: -80).isActive = true
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        }
    func conifguremass() {
        massLabel.translatesAutoresizingMaskIntoConstraints = false
        massLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(massLabel)
        massLabel.textColor = .white
        massLabel.topAnchor.constraint(equalTo: surfaceAreaLabel.bottomAnchor, constant: 4).isActive = true //
        massLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: -80).isActive = true
        massLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
        
    }
    
    func configureAreaforMars() {
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        areaLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(areaLabel)
        areaLabel.textColor = .white
        areaLabel.topAnchor.constraint(equalTo: surfaceAreaLabel.bottomAnchor, constant: 4).isActive = true
        areaLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: -80).isActive = true
        areaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
    }

    
    func configure(with imageName: String) {
            planetImageView.image = UIImage(named: imageName)
        }
    func Name(name: String) {
            nameLabel.text = name
        }
    func Area(area: String) {
        surfaceAreaLabel.text = area
    }
    func butonn1(button: String) {
                icon.image = UIImage(named: button)
        }
    func temperature(temeprature: String) {
        temperatureLabel.text = "Temperatrue                       \(temeprature)"
    }
    func mass(Mass: String) {
        massLabel.text = "Mass                              \(Mass)"
        }
    func Area1(area: String) {
        areaLabel.text = "Area                          \(area)"
    }
    

    
    
    

}

#Preview {
    let vc = DetailsMarsVC()
    return vc
}
