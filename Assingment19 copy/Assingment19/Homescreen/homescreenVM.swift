import Foundation

import MyLibrary
import Formatting

class HomeScreenViewModel {
    
    private(set) var articles: [NewsArticle] = []
    var reloadTableViewClosure: (() -> Void)?
    
    private let networkService: NetworkServiceProtocol
    private let formattingService: FormattingServiceProtocol
 
    init(networkService: NetworkServiceProtocol = NetworkService(), formattingService: FormattingServiceProtocol = FormattingService()) {
        self.networkService = networkService
        self.formattingService = formattingService
    }
    
    func fetchNews() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=c5bfd80365884721a384e03c06e9b9c6"
        
        networkService.fetchData(urlString: urlString) { (result: Result<NewsResponseData, NetworkError>) in
            switch result {
            case .success(let newsResponse):
                self.articles = newsResponse.articles ?? []
                DispatchQueue.main.async {
                    self.reloadTableViewClosure?()
                }
            case .failure(let error):
                print("Error fetching articles: \(error)")
            }
        }
    }
    
    func formattedDate(at index: Int) -> String {
            let article = articles[index]
            return formattingService.formatDate(article.publishedAt)
        }
    
    func article(at index: Int) -> NewsArticle {
        return articles[index]
    }
    
    var numberOfArticles: Int {
        return articles.count
    }
}
