import Foundation

class DetailsViewModel {
    private let article: NewsArticle
    
    init(article: NewsArticle) {
        self.article = article
    }
    
    var title: String {
        return article.title
    }
    
    var author: String {
        return "Published by \(article.author ?? "Unknown")"
    }
    
    var content: String {
        return article.content ?? "No content available"
    }
    
    var publishedAt: String {
        return article.publishedAt
    }
    
    var imageUrl: URL? {
        guard let urlString = article.urlToImage else { return nil }
        return URL(string: urlString)
    }
}
