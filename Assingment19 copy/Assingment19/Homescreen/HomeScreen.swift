import UIKit

class HomeScreenVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let viewModel = HomeScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        viewModel.fetchNews()
    }
    
    private func setupUI() {
        title = "Latest News"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticles
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 128
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
              return UITableViewCell()
          }
          
          let article = viewModel.article(at: indexPath.row)
          let formattedDate = viewModel.formattedDate(at: indexPath.row)
          cell.configure(with: article, formattedDate: formattedDate)
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
          
          let article = viewModel.article(at: indexPath.row)
          let detailsViewModel = DetailsViewModel(article: article)
          let detailVC = DetailsVc(viewModel: detailsViewModel)
          navigationController?.pushViewController(detailVC, animated: true)
      }
}
