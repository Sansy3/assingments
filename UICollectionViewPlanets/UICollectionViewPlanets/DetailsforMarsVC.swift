//
//  DetailsforMarsVC.swift
//  UICollectionViewPlanets
//
//  Created by beqa on 21.10.24.
//

import UIKit

class DetailsforMarsVC: UIViewController {
    
     var bigMars = UIImageView ()
     var labelarea = UILabel ()
     var Temperature = UILabel ()
     var mass = UILabel ()
     var titleLable = UILabel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Mars()
        LabelForArea()
        LabelForTemperature()
        labelForMass()
        Setuptitle()
        view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)

    }
    
    func Setuptitle() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLable)
        titleLable.textColor = .white
        titleLable.font = UIFont.boldSystemFont(ofSize: 36)
        titleLable.textAlignment = .center
        titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLable.widthAnchor.constraint(equalToConstant: 151).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 39).isActive = true
        
    }
    
    func Mars() {
        bigMars.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bigMars)
        bigMars.contentMode = .scaleAspectFit
        bigMars.clipsToBounds = true
        bigMars.topAnchor.constraint(equalTo: view.topAnchor, constant: 158).isActive = true
        bigMars.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        bigMars.widthAnchor.constraint(equalToConstant: 280).isActive = true
        bigMars.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    func LabelForArea() {
        labelarea.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelarea)
        labelarea.textAlignment = .center
        labelarea.textColor = .white
        labelarea.lineBreakMode = .byWordWrapping
        labelarea.widthAnchor.constraint(equalToConstant: 320).isActive = true
        labelarea.heightAnchor.constraint(equalToConstant: 52).isActive = true
        labelarea.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelarea.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        labelarea.layer.borderWidth = 2
        labelarea.layer.borderColor = UIColor.white.cgColor
        labelarea.layer.cornerRadius = 10
        labelarea.clipsToBounds = true
        
        
    }
    func LabelForTemperature () {
        Temperature.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Temperature)
        Temperature.textAlignment = .center
        Temperature.textColor = .white
        Temperature.lineBreakMode = .byWordWrapping
        Temperature.widthAnchor.constraint(equalToConstant: 320).isActive = true
        Temperature.heightAnchor.constraint(equalToConstant: 52).isActive = true
        Temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Temperature.topAnchor.constraint(equalTo: labelarea.topAnchor, constant: 70).isActive = true
        Temperature.layer.borderWidth = 2
        Temperature.layer.borderColor = UIColor.white.cgColor
        Temperature.layer.cornerRadius = 10
        Temperature.clipsToBounds = true
        
        
    }
    func labelForMass () {
        mass.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mass)
        mass.textAlignment = .center
        mass.textColor = .white
        mass.lineBreakMode = .byWordWrapping
        mass.widthAnchor.constraint(equalToConstant: 320).isActive = true
        mass.heightAnchor.constraint(equalToConstant: 52).isActive = true
        mass.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mass.topAnchor.constraint(equalTo: Temperature.topAnchor, constant: 70).isActive = true
        mass.layer.borderWidth = 2
        mass.layer.borderColor = UIColor.white.cgColor
        mass.layer.cornerRadius = 10
        mass.clipsToBounds = true
        
        
    }
}
    
        
        


#Preview {
   let vc =  DetailsforMarsVC()
    return vc
}
