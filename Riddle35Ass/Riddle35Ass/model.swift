//
//  Untitled.swift
//  Riddle35Ass
//
//  Created by beqa on 27.12.24.
//

import SwiftUI
import Foundation

struct Riddle: Identifiable {
    let id = UUID()
    let emojiSequence: String
    let correctAnswer: String
    var possibleAnswers: [String] {
        (incorrectAnswers + [correctAnswer]).shuffled()
    }
    private let incorrectAnswers: [String]

    init(emojiSequence: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.emojiSequence = emojiSequence
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
    }
}
