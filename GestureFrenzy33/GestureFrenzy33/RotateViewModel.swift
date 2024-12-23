//
//  Untitled.swift
//  GestureFrenzy33
//
//  Created by beqa on 18.12.24.
//

import SwiftUI

class RotateViewModel: ObservableObject {
    @Published var angle: Angle = .zero
    
    func rotate(_ value: Angle) {
        angle = value
    }
}
