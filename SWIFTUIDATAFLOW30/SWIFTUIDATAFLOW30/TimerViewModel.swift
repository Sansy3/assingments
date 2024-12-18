import Foundation

class TimerModel: ObservableObject {
    @Published var name: String
    @Published var duration: TimeInterval
    @Published var remainingTime: TimeInterval
    @Published var isRunning: Bool = false
    @Published var history: [(date: Date, duration: TimeInterval)] = []
    
    private var timer: Timer?
    private var startDate: Date?
    
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
        startDate = Date() 
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
        guard isRunning else { return }
        isRunning = false
        if let startDate = startDate {
            let elapsed = Date().timeIntervalSince(startDate)
            self.history.append((date: Date(), duration: elapsed))
        }
        timer?.invalidate()
        self.startDate = nil
    }
    
    func reset() {
        pause()
        remainingTime = duration
        if let startDate = startDate {
            let elapsed = Date().timeIntervalSince(startDate)
            self.history.append((date: Date(), duration: elapsed))
        } else {
            print("Start date was not available.")
        }
    }
    
    func delete() {
        pause()
    }
    
    private func stop() {
        isRunning = false
        if let startDate = startDate {
            let elapsed = Date().timeIntervalSince(startDate)
            self.history.append((date: Date(), duration: elapsed))
        }
        timer?.invalidate()
        remainingTime = 0
    }
}
