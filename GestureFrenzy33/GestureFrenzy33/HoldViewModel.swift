//
//  HoldViewModel.swift
//  GestureFrenzy33
//
//  Created by beqa on 18.12.24.
//
import SwiftUI

class HoldViewModel: ObservableObject {
    @Published var isHolding: Bool = false
    @Published var rotation: Double = 0
    
    func spinWheel(translation: CGSize) {
        rotation += Double(translation.width) * 0.1
    }
}
