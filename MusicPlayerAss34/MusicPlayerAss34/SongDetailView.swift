//
//  SongDetailView.swift
//  MusicPlayerAss34
//
//  Created by beqa on 24.12.24.
//

import SwiftUI

struct SongDetailView: View {
    @ObservedObject var viewModel: MusicPlayerViewModel
    let song: Song
    @State private var dominantColor: UIColor = .clear
    
    var body: some View {
        ZStack {
            Color(dominantColor)
                .ignoresSafeArea()
            
            VStack {
                Image(song.Art)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding()
                    .onAppear {
                        if let uiImage = UIImage(named: song.Art) {
                            if let color = uiImage.dominantColor {
                                dominantColor = color
                            }
                        }
                    }
                
                Text(song.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text(song.artist)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                UIKitProgressView(progress: $viewModel.playbackProgress)
                    .frame(height: 10)
                    .padding()
                
                HStack {
                    Text(viewModel.currentTimeFormatted)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text(viewModel.totalDurationFormatted)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                HStack {
                    Button(action: {
                        viewModel.playPause(song: song)
                    }) {
                        Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
            }
            .navigationTitle("Now Playing")
            .onDisappear {
                viewModel.stop()
            }
        }
    }
    
}
