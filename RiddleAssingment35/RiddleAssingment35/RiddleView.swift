import SwiftUI

struct RiddleView: View {
    @ObservedObject var viewModel: RiddleViewModel

    var body: some View {
        VStack {
            // Display the emoji sequence (riddle)
            Text(viewModel.riddle.emojiSequence)
                .font(.largeTitle)
                .padding()

            // Display the options as buttons
            AnswerOptionsView(options: viewModel.riddle.options, action: { selectedOption in
                viewModel.checkAnswer(selectedOption)
            })

            // Navigate to result screen when answer is selected
            NavigationLink(destination: ResultView(score: viewModel.score, resultMessage: viewModel.resultMessage)) {
                Text("See Results")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationBarTitle("Emoji Riddle", displayMode: .inline)
        .padding()
    }
}

struct ResultView: View {
    var score: Int
    var resultMessage: String

    var body: some View {
        VStack {
            Text(resultMessage)
                .font(.largeTitle)
                .padding()
            Text("Your score is \(score)")
                .font(.subheadline)
                .padding()
        }
        .navigationBarTitle("Result", displayMode: .inline)
    }
}
