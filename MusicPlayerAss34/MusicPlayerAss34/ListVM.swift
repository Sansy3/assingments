//
//  ListVM.swift
//  MusicPlayerAss34
//
//  Created by beqa on 24.12.24.
//

import AVFoundation
import SwiftUI

class MusicPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var currentSong: Song?
    @Published var playbackProgress: Double = 0.0

    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?

    func playPause(song: Song) {
        if currentSong == song {
            if isPlaying {
                pause()
            } else {
                play()
            }
        } else {
            startNewSong(song: song)
        }
    }

    private func startNewSong(song: Song) {
        stop()
        currentSong = song
        if let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                play()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }

    private func play() {
        audioPlayer?.play()
        isPlaying = true
        startTimer()
    }

    private func pause() {
        audioPlayer?.pause()
        isPlaying = false
        stopTimer()
    }

     func stop() {
        audioPlayer?.stop()
        isPlaying = false
        playbackProgress = 0.0
        stopTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let player = self.audioPlayer {
                self.playbackProgress = player.currentTime / player.duration
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
     func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var currentTimeFormatted: String {
            if let player = audioPlayer {
                return formatTime(player.currentTime)
            }
            return "00:00"
        }

        var totalDurationFormatted: String {
            if let player = audioPlayer {
                return formatTime(player.duration)
            }
            return "00:00"
        }
    
    
}
