//
//  answersview.swift
//  RiddleAssingment35
//
//  Created by beqa on 27.12.24.
//

//import SwiftUI
//
//struct AnswerOptionsView: View {
//    var options: [String]
//    var action: (String) -> Void  // Closure to handle the selected answer
//
//    var body: some View {
//        VStack(spacing: 16) {
//            ForEach(options, id: \.self) { option in
//                Button(action: {
//                    action(option)  // Call the action closure when an option is selected
//                }) {
//                    Text(option)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black)  // Background color
//                        .foregroundColor(.black)  // Text color (black)
//                        .cornerRadius(8)
//                        .padding(.horizontal)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.gray, lineWidth: 1)  // Optional border
//                        )
//                }
//            }
//        }
//    }
//}
