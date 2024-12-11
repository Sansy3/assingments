import Foundation

class TimerModel: ObservableObject {
    @Published var name: String
    @Published var duration: TimeInterval
    @Published var remainingTime: TimeInterval
    @Published var isRunning: Bool = false
    
    private var timer: Timer?
    
    init(name: String, hours: Int, minutes: Int, seconds: Int) {
        self.name = name
        let totalDuration = TimeInterval(hours * 3600 + minutes * 60 + seconds)
        self.duration = totalDuration
        self.remainingTime = totalDuration
    }
    
    var remainingTimeString: String {
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func start() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                DispatchQueue.main.async {
                    self.remainingTime -= 1
                }
            } else {
                self.stop()
            }
        }
    }
    
    func pause() {
        isRunning = false
        timer?.invalidate()
    }
    
    func reset() {
        pause()
        remainingTime = duration
    }
    
    func delete() {
        pause()
    }
    
    private func stop() {
        isRunning = false
        timer?.invalidate()
        remainingTime = 0
    }
}
