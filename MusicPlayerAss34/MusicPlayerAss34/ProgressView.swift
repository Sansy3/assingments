//
//  Untitled.swift
//  MusicPlayerAss34
//
//  Created by beqa on 24.12.24.
//

import SwiftUI
import UIKit

struct UIKitProgressView: UIViewRepresentable {
    @Binding var progress: Double
    

    func makeUIView(context: Context) -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .white
        progressView.trackTintColor = .gray  
        return progressView
    }

    func updateUIView(_ uiView: UIProgressView, context: Context) {
        uiView.progress = Float(progress)
    }
}
