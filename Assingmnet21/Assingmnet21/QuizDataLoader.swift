import Foundation



class QuizDataLoader {
    
    func loadQuizData() -> [QuizQuestion]? {
        guard let url = Bundle.main.url(forResource: "Questions", withExtension: "json") else {
            print("JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let quizResponse = try decoder.decode(QuizResponse.self, from: data)
            return quizResponse.results
        } catch {
            print("Error loading JSON data: \(error)")
            return nil
        }
    }
}
