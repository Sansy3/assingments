//
//  Untitled.swift
//  MusicPlayerAss34
//
//  Created by beqa on 24.12.24.
//

import Foundation

struct Song: Identifiable , Equatable {
    
    let id = UUID()
    let title: String
    let artist: String
    let Art: String
    let fileName: String
    let genre: String
}
