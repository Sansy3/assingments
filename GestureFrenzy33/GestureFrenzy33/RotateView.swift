//
//  Untitled 2.swift
//  GestureFrenzy33
//
//  Created by beqa on 18.12.24.
//

import SwiftUI

struct RotateView: View {
    @StateObject private var viewModel = RotateViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 59 / 255, green: 119 / 255, blue: 91 / 255, opacity: 1)
            VStack {
                Image("Calculator")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .rotationEffect(viewModel.angle)
                    .gesture(
                        RotationGesture()
                            .onChanged { value in
                                viewModel.rotate(value)
                            }
                    )
            }
            .padding()
        }
    }
}


