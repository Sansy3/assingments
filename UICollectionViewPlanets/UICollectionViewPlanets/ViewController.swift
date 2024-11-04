//
//  ViewController.swift
//  UICollectionViewPlanets
//
//  Created by beqa on 20.10.24.
//

import UIKit

class Planet {
    var name: String = ""
    var area: String = ""
    var temperatrue: String = ""
    var mass: String = ""
    var image: String
    var star: String
    var isFavourite: Bool
    
    init(name: String, area: String, temperatrue: String, mass: String, image: String , star: String, isFavourite: Bool) {
        self.name = name
        self.area = area
        self.temperatrue = temperatrue
        self.mass = mass
        self.image = image
        self.star = star
        self.isFavourite = isFavourite
    }
}
// VARIABLES

var planets = [Planet(name: "Mercury", area: "74,800,000 km2", temperatrue: "167°C", mass: "3.30 × 10²³ kg", image:"Mercury", star: "Star", isFavourite: false),
               Planet(name: "Venus", area: "460,000,000 km²", temperatrue: "464°C", mass: "4.87 × 10²⁴ kg", image: "Venus", star: "Star",isFavourite: false),
               Planet(name: "Earth", area: "510,100,100 km2", temperatrue: "15°C", mass: "5.97 × 10²⁴ kg", image: "Earth", star: "Star",isFavourite: false),
               Planet(name: "Mars", area: "144,800,000 km²", temperatrue: "−18°C", mass: "6.42 × 10²³ kg", image:"mars", star: "Star",isFavourite: false),
                Planet(name: "Jupiter", area: "6,142E10 km²", temperatrue: "−108°C", mass: "1.90 × 10²⁷ kg", image:"Jupiter", star: "Star",isFavourite: false),
                Planet(name: "Uranus", area: "8,083E9 km²", temperatrue: "−195°C", mass: "8.68 × 10²⁵ kg", image: "Uranus", star: "Star",isFavourite: false),
              ]
//UItools

let collectionForPlanets: UICollectionView = {
    let collection = UICollectionViewFlowLayout()
    collection.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collection)
    collectionView.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)

    return collectionView
}()
let TitleLable = UILabel() 
let titleLable = UILabel()


class PlanetsVC: UIViewController, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)

        
    }
    
    func setupUI () {
        CollectionView()
        Setuptitle()
    }
    
    func Setuptitle() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLable)
        titleLable.text = "Planets"
        titleLable.textColor = .white
        titleLable.font = UIFont.boldSystemFont(ofSize: 36)
        titleLable.textAlignment = .center
        titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLable.widthAnchor.constraint(equalToConstant: 151).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 39).isActive = true
        
    }
    
    
    func CollectionView() {
        collectionForPlanets.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionForPlanets)
        collectionForPlanets.topAnchor.constraint(equalTo: view.topAnchor, constant: 129).isActive = true
        collectionForPlanets.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionForPlanets.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionForPlanets.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionForPlanets.dataSource = self
        collectionForPlanets.delegate = self
        collectionForPlanets.register(UINib(nibName: "PlanetCell", bundle: nil), forCellWithReuseIdentifier: "PlanetCell")
        
    }
  

}

extension PlanetsVC: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planets.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCell
        let planet = planets[indexPath.row]
        cell?.massLabel.text = planet.area
        cell?.nameLabel.text = planet.name
        cell?.planetImageView.image = UIImage(named: planet.image)
        cell?.starImg.image = UIImage(named: "Star")
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 16
        let padding = spacing * (numberOfItemsPerRow + 1)
        let availableWidth = totalWidth - padding
        let widthPerItem = availableWidth / numberOfItemsPerRow
        
        return CGSize(width: widthPerItem, height: 225)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 0)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let planet = planets[indexPath.row]
        let vc = DetailsforMarsVC()
        vc.titleLable.text = planet.name
        vc.labelarea.text = "Area                                  \(planet.area)"
        vc.mass.text = "Mass                                    \(planet.mass)"
        vc.Temperature.text = "Temperature                                    \(planet.temperatrue)"
        vc.bigMars.image = UIImage(named: planet.image)
        navigationController?.pushViewController(vc, animated: true)
        
        }
        
    }






#Preview {
   let vc =  DetailsforMarsVC()
    return vc
}
