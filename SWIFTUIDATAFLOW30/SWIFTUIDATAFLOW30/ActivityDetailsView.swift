import SwiftUI

struct ActivityDetailsView: View {
    var timer: TimerModel
    
    var body: some View {
        VStack(spacing: 20) {
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
            .frame(maxWidth: 360, maxHeight: 328)
            .padding()
            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
            .cornerRadius(15)
            .padding()
            
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
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(timer.history, id: \.date) { entry in
                            HStack {
                                Text("\(entry.date, formatter: dateFormatter())")
                                Spacer()
                                Text("\(entry.duration, specifier: "%.2f") წამი")
                            }
                            .font(.body)
                            .foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: 360, maxHeight: 383)
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
}

private func dateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}
