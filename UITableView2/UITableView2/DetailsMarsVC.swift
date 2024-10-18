//
//  DetailsMarsVC.swift
//  UITableView2
//
//  Created by beqa on 18.10.24.
//

import UIKit


class DetailsMarsVC: UIViewController, UITableViewDelegate {
    
    
    var planet: Planet!
    
    private let tableview1 = UITableView()
    private let mars = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)
        
    }
    
    func setupUI() {
        setupTableView()
        mars1()
        Setuptitle()
        
    }
    
    
    
    
    func setupTableView() {
        tableview1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableview1)
        tableview1.topAnchor.constraint(equalTo: view.topAnchor, constant: 508).isActive = true
        tableview1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview1.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        tableview1.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        tableview1.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)
        tableview1.dataSource = self
        tableview1.delegate = self
        
        
        
    }
    func mars1 () {
        mars.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mars)
        mars.contentMode = .scaleAspectFit
        mars.clipsToBounds = true
        mars.topAnchor.constraint(equalTo: view.topAnchor, constant: 158).isActive = true
        mars.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        mars.widthAnchor.constraint(equalToConstant: 280).isActive = true
        mars.heightAnchor.constraint(equalToConstant: 350).isActive = true
        mars.image = UIImage(named: "mars")
       
}
    
    func Setuptitle() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLable)
        titleLable.text = "Mars"
        titleLable.textColor = UIColor(red: 179/255, green: 68/255, blue: 22/255, alpha: 1.0)
        titleLable.font = UIFont.boldSystemFont(ofSize: 36)
        titleLable.textAlignment = .center
        titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLable.widthAnchor.constraint(equalToConstant: 151).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 39).isActive = true
        
        
    }
    
    
    
    

}



extension DetailsMarsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Return the number of details to show
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let planet = planets[indexPath.row]
        if indexPath.row == 0 {
            cell.temperature(temeprature: planet.temeprature)
        } else if indexPath.row == 1 {
            cell.mass(Mass: planet.Mass)
        } else if indexPath.row == 2 {
            cell.Area1(area: planet.area)
        }

        return cell
    }}
        
        
    
    #Preview {
        let vc = DetailsMarsVC()
        return vc
    }
    
