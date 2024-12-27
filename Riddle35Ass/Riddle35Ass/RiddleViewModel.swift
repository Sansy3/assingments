import SwiftUI
import Combine

class RiddleViewModel: ObservableObject {
    @Published var score = 0
    @Published var currentRiddle: Riddle
    @Published var feedback: String? = nil
    @Published var gameOver = false
    
    let category: String
    var riddles: [Riddle]
    
    init(category: String) {
        self.category = category
        self.riddles = Riddle.getRiddles(for: category)
        self.currentRiddle = riddles.randomElement()!
    }
    
    func submitAnswer(_ answer: String) {
        if answer == currentRiddle.correctAnswer {
            score += 1
            feedback = "Correct!"
        } else {
            feedback = "Incorrect!"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if self.riddles.isEmpty {
                self.gameOver = true
            } else {
                self.nextRiddle()
            }
        }
    }
    
    func nextRiddle() {
        currentRiddle = riddles.randomElement()!
        feedback = nil
    }
    
    func restartGame() {
        score = 0
        riddles = Riddle.getRiddles(for: category)
        nextRiddle()
        gameOver = false
    }
}
