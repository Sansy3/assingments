//
//  ViewController.swift
//  UITableView2
//
//  Created by beqa on 17.10.24.
//
public struct Planet {
    let name: String
    let imageName: String
    let area: String
    let button: String
    let temeprature: String
    let Mass: String
}

import UIKit

let tableView = UITableView()
let titleLable = UILabel()

let planets = [
    Planet(name: "Mars", imageName: "mars", area: "1,258,250 km2", button: "icon", temeprature: "-18C", Mass: "6,39E23 kg"),
       Planet(name: "Jupiter", imageName: "Jupiter", area: "6,142E10 km2", button: "icon",temeprature: "-18C", Mass: "6,39E23 kg"),
       Planet(name: "Earth", imageName: "Earth", area: "500,100,100 km2", button: "icon",temeprature: "-18C", Mass: "6,39E23 kg"),
       Planet(name: "Saturn", imageName: "Saturn",area: "2,608,250 km2", button: "icon",temeprature: "-18C", Mass: "6,39E23 kg")
   ]

class ViewController: UIViewController, UITableViewDelegate {
    
   
 
    let tableView = UITableView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        Setuptitle()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)
        
        
    }
    func Setuptitle() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLable)
        titleLable.text = "Planets"
        titleLable.textColor = UIColor(red: 179/255, green: 68/255, blue: 22/255, alpha: 1.0)
        titleLable.font = UIFont.boldSystemFont(ofSize: 36)
        titleLable.textAlignment = .center
        titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLable.widthAnchor.constraint(equalToConstant: 151).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 39).isActive = true
        
    }
    
   
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell()
        let planet = planets[indexPath.row]
        cell.configure(with: planet.imageName)
        cell.Name(name: planet.name)
        cell.Area(area: planet.area)
        cell.butonn1(button: planet.button)
        return cell


        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    

    
    
}


#Preview {
    let vc = ViewController()
    return vc
}



