//import Foundation
//import Combine
//
//
//class RiddleViewModel: ObservableObject {
//    @Published var riddle: Riddle
//    @Published var score: Int = 0
//    @Published var showResult: Bool = false
//    @Published var resultMessage: String = ""
//
//    private var cancellables = Set<AnyCancellable>()
//    private var networkManager: NetworkManager
//
//    init(riddle: Riddle, networkManager: NetworkManager = .shared) {
//        self.riddle = riddle
//        self.networkManager = networkManager
//    }
//
//    func checkAnswer(_ answer: String) {
//        if answer == riddle.correctAnswer {
//            score += 1
//            resultMessage = "Correct!"
//        } else {
//            resultMessage = "Wrong!"
//        }
//        showResult = true
//    }
//
//    func reset() {
//        showResult = false
//        resultMessage = ""
//    }
//
//    func fetchNewRiddle() {
//        let prompt = "Please generate a new riddle with emojis"
//        networkManager.fetchAIResponse(prompt: prompt) { [weak self] riddle in
//            DispatchQueue.main.async {
//                if let newRiddle = riddle {
//                    self?.riddle = newRiddle
//                    self?.score = 0
//                    self?.reset()  
//                }
//            }
//        }
//    }
//}
