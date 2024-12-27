import SwiftUI

struct RiddleView: View {
    @ObservedObject var viewModel: RiddleViewModel

    var body: some View {
        VStack {
            // Header with Score
            HStack {
                Text("Score: \(viewModel.score)")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
            }
            .padding()

            // Riddle Emoji
            Text(viewModel.currentRiddle.emojiSequence)
                .font(.system(size: 64))
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                .padding()

            // Feedback
            if let feedback = viewModel.feedback {
                Text(feedback)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(feedback == "Correct!" ? .green : .red)
                    .transition(.opacity.combined(with: .scale))
            }

            // Answer Options
            VStack(spacing: 12) {
                ForEach(viewModel.currentRiddle.possibleAnswers, id: \.self) { answer in
                    Button(action: {
                        viewModel.submitAnswer(answer)
                    }) {
                        Text(answer)
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: .blue.opacity(0.4), radius: 5, x: 0, y: 3)
                    }
                }
            }
            .padding(.horizontal, 16)

            Spacer()

            // Restart Button
            if viewModel.gameOver {
                Button(action: viewModel.restartGame) {
                    Text("Play Again")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(12)
                        .shadow(color: .green.opacity(0.4), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 16)
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.white, .blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .animation(.easeInOut, value: viewModel.feedback)
        .navigationBarTitle("Riddle", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
    }
}
