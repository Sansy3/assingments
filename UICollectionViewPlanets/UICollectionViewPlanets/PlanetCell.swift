//
//  PlanetCell.swift
//  UICollectionViewPlanets
//
//  Created by beqa on 20.10.24.
//

import UIKit

class PlanetCell: UICollectionViewCell {
    
    private let planetImageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let massLabel: UILabel = UILabel()
    private let starImg: UIImageView = UIImageView()
    let starButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Starempty"), for: .normal)
        return button
    }()
    var isFavourite: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        PlanetImage()
        Planetname()
        Planetmass()
        star()
        starButton.addAction(UIAction { [weak self] _ in
            self?.toggleFavourite()
        }, for: .touchUpInside)
    }
    
    
    
    func PlanetImage() {
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(planetImageView)
        planetImageView.contentMode = .scaleAspectFit
        planetImageView.clipsToBounds = true
        planetImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        planetImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        planetImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        planetImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func Planetname() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        contentView.addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: planetImageView.centerXAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -19).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        
        
    }
    func Planetmass() {
        massLabel.translatesAutoresizingMaskIntoConstraints = false
        massLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentView.addSubview(massLabel)
        massLabel.textAlignment = .center
        massLabel.numberOfLines = 0
        massLabel.textColor = .white
        massLabel.lineBreakMode = .byWordWrapping
        massLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        massLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        massLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        
        
    }
    func star() {
        starButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starButton)
        starButton.contentMode = .scaleAspectFit
        starButton.clipsToBounds = true
        starButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        starButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: -30).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    
    func configure(with imageName: String) {
        planetImageView.image = UIImage(named: imageName)
    }
    func configureName(with Name: String) {
        nameLabel.text = Name
    }
    func configuremass(with Mass: String) {
        massLabel.text = Mass
    }
    func configurestar(with star: String) {
        starImg.image = UIImage(named: star)
    }
    
    func toggleFavourite() {
        isFavourite = !isFavourite
        updateStar()
    }

    
    func updateStar() {
        if isFavourite == false {
            starButton.setImage(UIImage(named: "Starempty"), for: .normal)
        } else {
            starButton.setImage(UIImage(named: "Star"), for: .normal)
        }
    }
    
    
    
    
}
    #Preview {
        let vc =  PlanetsVC()
        return vc
    }
