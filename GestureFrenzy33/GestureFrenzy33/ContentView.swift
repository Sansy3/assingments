//
//  ContentView.swift
//  GestureFrenzy33
//
//  Created by beqa on 18.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SpinView()
                .tabItem {
                    Image("Spin")
                    Text("Spin")
                }
            HoldView()
                .tabItem {
                    Image("Hold")
                    Text("Hold")
                }
            RotateView()
                .tabItem {
                    Image("Rotate")
                    Text("Rotate")
                }
            TrashView()
                .tabItem {
                    Image("Trash2")
                    Text("Trash")
                }
        }
        .accentColor(Color(red: 59 / 255, green: 119 / 255, blue: 91 / 255))
    }
}

