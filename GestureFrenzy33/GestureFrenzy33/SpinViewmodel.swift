//
//  SpinViewmodel.swift
//  GestureFrenzy33
//
//  Created by beqa on 18.12.24.
//

import SwiftUI

class SpinViewModel: ObservableObject {
    @Published var rotation: Double = 0
    
    func spinWheel(translation: CGSize) {
        if translation.height > 0 {
            rotation += 5
        }
    }
}
