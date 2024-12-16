import SwiftUI

struct QuickTimerSheetView: View {
    @Binding var isPresented: Bool
    var onTimerSelect: (String, TimeInterval) -> Void
    
    let quickTimers: [(name: String, duration: TimeInterval)] = [
        ("ჩაის დაყენება", 3 * 60),
        ("HIIT ვარჯიში", 7 * 60),
        ("კვერცხის მოხარშვა", 10 * 60),
        ("შესვენება", 15 * 60),
        ("ყველა პაუზა", 20 * 60),
        ("პომოდორო", 25 * 60),
        ("მედიტაცია", 30 * 60),
        ("ვარჯიში", 45 * 60),
        ("სამუშაო სესია", 60 * 60)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("სწრაფი ტაიმერები")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                    ForEach(quickTimers, id: \.name) { timer in
                        Button(action: {
                            onTimerSelect(timer.name, timer.duration)
                            isPresented = false
                        }) {
                            VStack {
                                Text(timeString(for: timer.duration))
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                
                                Text(timer.name)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 100, height: 80)
                            .background(Color(red: 34/255, green: 34/255, blue: 34/255))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    private func timeString(for duration: TimeInterval) -> String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
