//
//  RiddleViewModel.swift
//  Riddle35Ass
//
//  Created by beqa on 27.12.24.
//

import SwiftUI
class RiddleViewModel: ObservableObject {
    @Published var riddles: [Riddle] = []
    @Published var currentRiddleIndex = 0
    @Published var score = 0
    @Published var feedback: String?
    @Published var gameOver = false

    init(category: String) {
        loadRiddles(for: category)
    }

    private func loadRiddles(for category: String) {
        switch category {
        case "Movies":
            riddles = [
                Riddle(emojiSequence: "🏴‍☠️⚔️🌊🗺️☠️", correctAnswer: "Pirates of the Caribbean", incorrectAnswers: ["Treasure Island", "Captain Phillips", "Robinson Crusoe"]),
                Riddle(emojiSequence: "🕶️🌃🖤🔫💊", correctAnswer: "The Matrix", incorrectAnswers: ["Blade Runner", "Inception", "The Dark Knight"]),
                Riddle(emojiSequence: "👸❄️⛄🌨️🎵", correctAnswer: "Frozen", incorrectAnswers: ["Tangled", "Moana", "Cinderella"]),
                Riddle(emojiSequence: "🦁👑🌅🎵🐾", correctAnswer: "The Lion King", incorrectAnswers: ["Jungle Book", "Madagascar", "Spirit"]),
                Riddle(emojiSequence: "🌌👨‍🚀🌍⌛️🌱", correctAnswer: "Interstellar", incorrectAnswers: ["Gravity", "The Martian", "Apollo 13"]),
                Riddle(emojiSequence: "🦖🏝️🌋🧪🦕", correctAnswer: "Jurassic Park", incorrectAnswers: ["King Kong", "Land Before Time", "Ice Age"]),
                Riddle(emojiSequence: "🕷️💥🕸️🌆🔴", correctAnswer: "Spider-Man", incorrectAnswers: ["Venom", "Iron Man", "Ant-Man"]),
                Riddle(emojiSequence: "🐠🔍🏝️🌊🦈", correctAnswer: "Finding Nemo", incorrectAnswers: ["Jaws", "Moana", "Shark Tale"]),
                Riddle(emojiSequence: "👨‍🦲🛡️💣🕵️‍♂️🎰", correctAnswer: "James Bond: Casino Royale", incorrectAnswers: ["Mission: Impossible", "Bourne Identity", "Kingsman"]),
                Riddle(emojiSequence: "🦇🖤🌃🃏💥", correctAnswer: "The Dark Knight", incorrectAnswers: ["Batman Begins", "Joker", "Gotham"])
            ]
        case "Books":
            riddles = [
                Riddle(emojiSequence: "🐳📘🛳️⚓️", correctAnswer: "Moby Dick", incorrectAnswers: ["Treasure Island", "Life of Pi", "The Old Man and the Sea"]),
                Riddle(emojiSequence: "📜👑⚔️🧙‍♂️", correctAnswer: "The Lord of the Rings", incorrectAnswers: ["Harry Potter", "Game of Thrones", "The Hobbit"]),
                Riddle(emojiSequence: "🦸‍♀️🔥🐦🏹🌆", correctAnswer: "The Hunger Games", incorrectAnswers: ["Divergent", "Maze Runner", "Red Queen"]),
                Riddle(emojiSequence: "🏰🌹🧙‍♂️🌌👩‍🎤", correctAnswer: "Harry Potter and the Sorcerer’s Stone", incorrectAnswers: ["Percy Jackson", "The Golden Compass", "Eragon"]),
                Riddle(emojiSequence: "🎩🐇🕳️❤️♠️", correctAnswer: "Alice in Wonderland", incorrectAnswers: ["The Wizard of Oz", "Peter Pan", "Coraline"]),
                Riddle(emojiSequence: "🌌👨‍🚀🛸📖👽", correctAnswer: "The War of the Worlds", incorrectAnswers: ["1984", "Dune", "Brave New World"]),
                Riddle(emojiSequence: "⚔️👑🧝‍♀️🏰🛡️", correctAnswer: "Game of Thrones", incorrectAnswers: ["The Witcher", "Lord of the Rings", "Merlin"]),
                Riddle(emojiSequence: "🛡️🧙‍♀️✨⚡️🐍", correctAnswer: "Harry Potter", incorrectAnswers: ["Narnia", "Fantastic Beasts", "Twilight"]),
                Riddle(emojiSequence: "🏞️🦁🧝‍♂️🔮❄️", correctAnswer: "The Chronicles of Narnia", incorrectAnswers: ["Alice in Wonderland", "Percy Jackson", "The Hobbit"]),
                Riddle(emojiSequence: "🏠📖👩‍👧‍👦🌪️🐕", correctAnswer: "The Wizard of Oz", incorrectAnswers: ["Little Women", "Charlotte’s Web", "Matilda"])
            ]
        case "Anime":
            riddles = [
                Riddle(emojiSequence: "🍙🎌⚔️👹", correctAnswer: "Naruto", incorrectAnswers: ["One Piece", "Bleach", "Attack on Titan"]),
                Riddle(emojiSequence: "🏰👩‍🎨🎵🌌", correctAnswer: "Your Name", incorrectAnswers: ["Spirited Away", "Castle in the Sky", "My Neighbor Totoro"]),
                Riddle(emojiSequence: "👊🔥⚔️🌪️🐉", correctAnswer: "Demon Slayer", incorrectAnswers: ["Dragon Ball Z", "Attack on Titan", "Jujutsu Kaisen"]),
                Riddle(emojiSequence: "⚡️🧒🐉💥🌌", correctAnswer: "Dragon Ball Z", incorrectAnswers: ["One Piece", "Hunter x Hunter", "Naruto"]),
                Riddle(emojiSequence: "🛳️🏝️👒🏴‍☠️🐵", correctAnswer: "One Piece", incorrectAnswers: ["Naruto", "Bleach", "Fairy Tail"]),
                Riddle(emojiSequence: "🎩🔪🎭🎩⚖️", correctAnswer: "Death Note", incorrectAnswers: ["Detective Conan", "Jujutsu Kaisen", "Tokyo Revengers"]),
                Riddle(emojiSequence: "🦸‍♂️✨🏫👊🔥", correctAnswer: "My Hero Academia", incorrectAnswers: ["Attack on Titan", "Naruto", "Dragon Ball"]),
                Riddle(emojiSequence: "🗻🌊⚔️💨🐀", correctAnswer: "Demon Slayer", incorrectAnswers: ["Attack on Titan", "Tokyo Ghoul", "Bleach"]),
                Riddle(emojiSequence: "🐱🌌🚞💞👧", correctAnswer: "Spirited Away", incorrectAnswers: ["My Neighbor Totoro", "Your Name", "Weathering with You"]),
                Riddle(emojiSequence: "⚔️🏔️🛡️👹💥", correctAnswer: "Attack on Titan", incorrectAnswers: ["Jujutsu Kaisen", "Demon Slayer", "Bleach"])
            ]
        default:
            riddles = []
        }
    }

    var currentRiddle: Riddle {
        riddles[currentRiddleIndex]
    }

    func submitAnswer(_ answer: String) {
        if answer == currentRiddle.correctAnswer {
            score += 1
            feedback = "Correct!"
        } else {
            feedback = "Incorrect!"
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.feedback = nil
            if self.currentRiddleIndex < self.riddles.count - 1 {
                self.currentRiddleIndex += 1
            } else {
                self.gameOver = true
            }
        }
    }

    func restartGame() {
        score = 0
        currentRiddleIndex = 0
        gameOver = false
    }
}
