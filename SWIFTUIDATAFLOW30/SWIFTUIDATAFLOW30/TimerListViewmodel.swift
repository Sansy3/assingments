import Foundation

class TimerListViewModel: ObservableObject {
    @Published var timers: [TimerModel] = []
    
    func addTimer(name: String, hours: Int, minutes: Int, seconds: Int) {
        let newTimer = TimerModel(name: name, hours: hours, minutes: minutes, seconds: seconds)
        timers.append(newTimer)
    }
    
    func removeTimer(at index: Int) {
        timers[index].delete()
        timers.remove(at: index)
    }
}
