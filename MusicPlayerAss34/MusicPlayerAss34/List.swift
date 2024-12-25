//
//  ContentView.swift
//  MusicPlayerAss34
//
//  Created by beqa on 24.12.24.
//

import SwiftUI
struct SongListView: View {
    @StateObject private var viewModel = MusicPlayerViewModel()

    let songs: [Song] = [
        Song(title: "Regulate", artist: "Warren G", Art: "regulate", fileName: "Regulate", genre: "Hip-Hop"),
        Song(title: "Music and Me", artist: "Nate Dogg", Art: "Musicandme", fileName: "Nate Dogg - Music and me", genre: "R&B"),
        Song(title: "Dictator Tifu", artist: "Mamaflex ft Mvxxpayne", Art: "Mamaflx", fileName: "mamaflex - Dictator Tifu ft Mvxxpayne", genre: "Hip-Hop"),
        Song(title: "Rumors", artist: "Father Dom", Art: "Fatherdom", fileName: "Rumors", genre: "Hip-Hop"),
        Song(title: "Lookin' At U", artist: "Warren G", Art: "Lookingatu", fileName: "Warren G - Lookin' At You", genre: "Hip-Hop")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(Dictionary(grouping: songs, by: { $0.genre }).keys.sorted(), id: \.self) { genre in
                    Section(header: Text(genre)) {
                        ForEach(songs.filter { $0.genre == genre }) { song in
                            NavigationLink(destination: SongDetailView(viewModel: viewModel, song: song)) {
                                HStack {
                                    Image(song.Art)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    VStack(alignment: .leading) {
                                        Text(song.title)
                                            .font(.headline)
                                        Text(song.artist)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Songs")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 50)
            })
        }
    }
}
