import SwiftUI

struct TimerView: View {
    @ObservedObject var timer: TimerModel
    var onDelete: () -> Void
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Text(timer.name)
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                
                Text(timer.remainingTimeString)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                
                HStack {
                    Button(action: {
                        if timer.isRunning {
                            timer.pause()
                        } else {
                            timer.start()
                        }
                    }) {
                        Text(timer.isRunning ? "პაუზა" : "დაწყება")
                            .padding()
                            .background(timer.isRunning ? Color.orange : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    Button(action: {
                        timer.reset()
                    }) {
                        Text("გადატვირთვა")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
            .cornerRadius(15)
            .shadow(radius: 5)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        onDelete()
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(8)
                            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
                            .clipShape(Circle())
                            .shadow(radius: 5)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
            }
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

