import Foundation

struct Riddle: Identifiable {
    let id = UUID()
    let emojiSequence: String
    let options: [String]
    let correctAnswer: String
    let category: Category
}

enum Category: String, CaseIterable {
    case movies = "Movies"
    case books = "Books"
    case anime = "Anime"
}
