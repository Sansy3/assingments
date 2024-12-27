struct Riddle {
    let emojiSequence: String
    let correctAnswer: String
    let possibleAnswers: [String]
    
    static func getRiddles(for category: String) -> [Riddle] {
        switch category {
        case "Movies":
            let riddles = [
                Riddle(emojiSequence: "🏴‍☠️⚔️🌊🗺️☠️", correctAnswer: "Pirates of the Caribbean", possibleAnswers: ["Pirates of the Caribbean", "Treasure Island", "Captain Phillips", "Robinson Crusoe"]),
                Riddle(emojiSequence: "🕶️🌃🖤🔫💊", correctAnswer: "The Matrix", possibleAnswers: ["The Matrix", "Blade Runner", "Inception", "The Dark Knight"]),
                Riddle(emojiSequence: "👸❄️⛄🌨️🎵", correctAnswer: "Frozen", possibleAnswers: ["Frozen", "Tangled", "Moana", "Cinderella"]),
                Riddle(emojiSequence: "🚢🌍💥🌊🧊", correctAnswer: "Titanic", possibleAnswers: ["Titanic", "The Poseidon Adventure", "Ice Age", "The Abyss"]),
                Riddle(emojiSequence: "🦁👑🌍🦓", correctAnswer: "The Lion King", possibleAnswers: ["The Lion King", "The Jungle Book", "Madagascar", "Zootopia"]),
                Riddle(emojiSequence: "🦇🦇🔫🌙", correctAnswer: "Batman", possibleAnswers: ["Batman", "Spiderman", "Iron Man", "Superman"]),
                Riddle(emojiSequence: "⚡️🦸‍♂️🌍🛸", correctAnswer: "Thor", possibleAnswers: ["Thor", "Iron Man", "Captain America", "Hulk"]),
                Riddle(emojiSequence: "👀🎩🧙‍♂️🔮", correctAnswer: "Alice in Wonderland", possibleAnswers: ["Alice in Wonderland", "The Wizard of Oz", "Peter Pan", "The Chronicles of Narnia"]),
                Riddle(emojiSequence: "🦇🌃🔪", correctAnswer: "The Dark Knight", possibleAnswers: ["The Dark Knight", "Iron Man", "Avengers", "Spider-Man"]),
                Riddle(emojiSequence: "🚀👨‍🚀🌌", correctAnswer: "Interstellar", possibleAnswers: ["Interstellar", "Star Wars", "Star Trek", "Gravity"])
            ]
            return riddles.map { riddle in
                var shuffledAnswers = riddle.possibleAnswers.shuffled()
                return Riddle(emojiSequence: riddle.emojiSequence, correctAnswer: riddle.correctAnswer, possibleAnswers: shuffledAnswers)
            }
            
        case "Anime":
            let riddles = [
                Riddle(emojiSequence: "🦸‍♂️⚔️🌍🌪️", correctAnswer: "Naruto", possibleAnswers: ["Naruto", "Attack on Titan", "One Piece", "Dragon Ball"]),
                Riddle(emojiSequence: "👨‍👩‍👧‍👦🐍👑", correctAnswer: "Fullmetal Alchemist", possibleAnswers: ["Fullmetal Alchemist", "Bleach", "Naruto", "My Hero Academia"]),
                Riddle(emojiSequence: "👩‍🏫🔪🎶", correctAnswer: "Death Note", possibleAnswers: ["Death Note", "Code Geass", "Attack on Titan", "Tokyo Ghoul"]),
                Riddle(emojiSequence: "👊🦸‍♂️🏫", correctAnswer: "My Hero Academia", possibleAnswers: ["My Hero Academia", "One Punch Man", "Dragon Ball Z", "Naruto"]),
                Riddle(emojiSequence: "⏳💀", correctAnswer: "Demon Slayer", possibleAnswers: ["Demon Slayer", "Attack on Titan", "One Piece", "Tokyo Ghoul"]),
                Riddle(emojiSequence: "💀🔨🧟‍♂️", correctAnswer: "Attack on Titan", possibleAnswers: ["Attack on Titan", "The Walking Dead", "The Last of Us", "Zombieland"]),
                Riddle(emojiSequence: "🍜🥷🏙️", correctAnswer: "Naruto", possibleAnswers: ["Naruto", "One Piece", "Bleach", "Dragon Ball"]),
                Riddle(emojiSequence: "⚔️👀🦉", correctAnswer: "Sword Art Online", possibleAnswers: ["Sword Art Online", "Attack on Titan", "Log Horizon", "Bleach"]),
                Riddle(emojiSequence: "🦸‍♂️⚔️💍", correctAnswer: "One Piece", possibleAnswers: ["One Piece", "Naruto", "Bleach", "Dragon Ball"]),
                Riddle(emojiSequence: "🐉👑⚔️", correctAnswer: "Dragon Ball", possibleAnswers: ["Dragon Ball", "Naruto", "Bleach", "One Piece"])
            ]
            return riddles.map { riddle in
                var shuffledAnswers = riddle.possibleAnswers.shuffled()
                return Riddle(emojiSequence: riddle.emojiSequence, correctAnswer: riddle.correctAnswer, possibleAnswers: shuffledAnswers)
            }
            
        case "Books":
            let riddles = [
                Riddle(emojiSequence: "📖⚔️👑", correctAnswer: "The Lord of the Rings", possibleAnswers: ["The Lord of the Rings", "The Hobbit", "Harry Potter", "Percy Jackson"]),
                Riddle(emojiSequence: "⚡️👦👓", correctAnswer: "Harry Potter", possibleAnswers: ["Harry Potter", "The Chronicles of Narnia", "Percy Jackson", "The Hobbit"]),
                Riddle(emojiSequence: "🐍🍎🍏", correctAnswer: "The Hunger Games", possibleAnswers: ["The Hunger Games", "Divergent", "Maze Runner", "Twilight"]),
                Riddle(emojiSequence: "🏹👦🔥", correctAnswer: "The Hunger Games", possibleAnswers: ["The Hunger Games", "Maze Runner", "Twilight", "Divergent"]),
                Riddle(emojiSequence: "🌹🦁", correctAnswer: "Beauty and the Beast", possibleAnswers: ["Beauty and the Beast", "Cinderella", "The Little Mermaid", "Sleeping Beauty"]),
                Riddle(emojiSequence: "🦹‍♀️🖤🕵️‍♂️", correctAnswer: "Sherlock Holmes", possibleAnswers: ["Sherlock Holmes", "The Adventures of Tintin", "Miss Marple", "Hercule Poirot"]),
                Riddle(emojiSequence: "🚢💔🌊", correctAnswer: "Titanic", possibleAnswers: ["Titanic", "The Great Gatsby", "A Tale of Two Cities", "The Odyssey"]),
                Riddle(emojiSequence: "👑🧙‍♂️🔥", correctAnswer: "Game of Thrones", possibleAnswers: ["Game of Thrones", "The Hobbit", "The Lord of the Rings", "Harry Potter"]),
                Riddle(emojiSequence: "👑⚔️🛡️", correctAnswer: "The Song of Ice and Fire", possibleAnswers: ["The Song of Ice and Fire", "Lord of the Rings", "Game of Thrones", "The Witcher"]),
                Riddle(emojiSequence: "🏹🎯💥", correctAnswer: "The Hunger Games", possibleAnswers: ["The Hunger Games", "Divergent", "Maze Runner", "Twilight"])
            ]
            return riddles.map { riddle in
                var shuffledAnswers = riddle.possibleAnswers.shuffled()
                return Riddle(emojiSequence: riddle.emojiSequence, correctAnswer: riddle.correctAnswer, possibleAnswers: shuffledAnswers)
            }
            
        default:
            return []
        }
    }
}
