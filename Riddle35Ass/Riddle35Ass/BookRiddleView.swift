//
//  BookRiddleView.swift
//  Riddle35Ass
//
//  Created by beqa on 27.12.24.
//

import SwiftUI

struct BookRiddleView: View {
    @ObservedObject var viewModel: RiddleViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Score: \(viewModel.score)")
                    .font(.headline)
                    .foregroundColor(.brown)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.yellow.opacity(0.6))
                    .cornerRadius(10)
                Spacer()
            }
            .padding()

            Text(viewModel.currentRiddle.emojiSequence)
                .font(.system(size: 64))
                .padding()
                .background(Color.orange.opacity(0.3))
                .cornerRadius(15)
                .shadow(color: .brown.opacity(0.5), radius: 5, x: 0, y: 2)
                .padding()

            if let feedback = viewModel.feedback {
                Text(feedback)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(feedback == "Correct!" ? .green : .red)
                    .transition(.opacity.combined(with: .scale))
            }

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
                            .background(Color.brown)
                            .cornerRadius(12)
                            .shadow(color: .brown.opacity(0.4), radius: 5, x: 0, y: 3)
                    }
                }
            }
            .padding(.horizontal, 16)

            Spacer()

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
                gradient: Gradient(colors: [Color.brown.opacity(0.6), Color.orange.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .navigationBarTitle("Book Riddle", displayMode: .inline)
    }
}
