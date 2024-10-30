//
//  ViewController.swift
//  Assingment19
//
//  Created by beqa on 30.10.24.
//
import Foundation
import UIKit

class HomeScreenVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    private var articles: [NewsArticle] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchNewsFrom()
    }

    private func setupUI() {
        title = "Latest News"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
       
    }
    
    func fetchNewsFrom() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=c5bfd80365884721a384e03c06e9b9c6#"
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with:urlRequest) { data , response , error in
            if let error {
                print(error)
            }
            
            
            guard let response = response as? HTTPURLResponse else {return}
            
            guard (200...299).contains(response.statusCode) else {return}
            
            guard let data else { return }
            
            
            do{
                let newsdata = try JSONDecoder().decode(NewsResponseData.self, from: data)
                self.articles.append(contentsOf: newsdata.articles ?? [])
                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
            }
            catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }

    
    

   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
            }
        let article = articles[indexPath.row]
        cell.configure(with:article )
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let selectedArticle = articles[indexPath.row]
            let detailVC = DetailsVc()
            detailVC.article = selectedArticle
            navigationController?.pushViewController(detailVC, animated: true) 
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 128
        }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let footerView = UIView()
           footerView.backgroundColor = .clear
           return footerView
       }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 20
        }
    
}

#Preview {
    HomeScreenVC()
}
