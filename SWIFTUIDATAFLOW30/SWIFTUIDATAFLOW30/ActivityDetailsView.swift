


import SwiftUI

struct ActivityDetailsView: View {
    var timer: TimerModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(timer.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            VStack {
                Image("Stopwatch")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                
                Text("ხანგრძლივობა")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(timer.remainingTimeString)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: 360, maxHeight: 180)
            .padding()
            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
            .cornerRadius(15)
            .padding()
            
            VStack {
                Text("სტატისტიკა")
                    .font(.headline)
                    .padding(.bottom, 5)
                    .foregroundColor(.white)
                
                Divider()
                
                HStack {
                    Text("დღევანდელი სესიების რაოდენობა")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(todaySessionsCount())")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text("სესიის საშუალო ხანგრძლივობა")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(averageSessionDuration(), specifier: "%.2f") წამი")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text("ჯამური დრო")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(totalTime(), specifier: "%.2f") წამი")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 5)
            }
            .padding()
            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
            .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text("აქტივობის ისტორია")
                    .font(.headline)
                    .padding(.bottom, 5)
                    .foregroundColor(.white)
                
                Divider()
                
                HStack {
                    Text("თარიღი")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("დრო")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 5)
                
                Divider()
                
                List {
                    ForEach(timer.history, id: \.date) { entry in
                        HStack {
                            Text(dateFormatter().string(from: entry.date))
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(entry.duration, specifier: "%.2f") წამი")
                                .foregroundColor(.white)
                        }
                        .listRowBackground(Color(red: 44/255, green: 44/255, blue: 44/255))
                        .padding(.horizontal, -20)
                        .padding(.vertical, 5)
                        
                        
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .listStyle(PlainListStyle())
                .background(Color(red: 44/255, green: 44/255, blue: 44/255))
                .cornerRadius(15)
                
            }
            .padding()
            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
            .cornerRadius(15)
            .shadow(radius: 5)
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle(timer.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func todaySessionsCount() -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return timer.history.filter { $0.date >= today }.count
    }
    
    private func averageSessionDuration() -> Double {
        let todayHistory = timer.history.filter { $0.date >= Calendar.current.startOfDay(for: Date()) }
        let totalDuration = todayHistory.reduce(0) { $0 + $1.duration }
        return todayHistory.isEmpty ? 0 : totalDuration / Double(todayHistory.count)
    }
    
    private func totalTime() -> Double {
        return timer.history.reduce(0) { $0 + $1.duration }
    }
}

private func dateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}
