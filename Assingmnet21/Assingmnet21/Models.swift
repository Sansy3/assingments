
import Foundation

struct QuizResponse: Codable {
    let response_code: Int
    let results: [QuizQuestion]
}

struct QuizQuestion: Codable {
    let questionNumber: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
