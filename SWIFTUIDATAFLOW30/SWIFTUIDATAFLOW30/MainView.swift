import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = TimerListViewModel()
    @State private var name: String = ""
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    @State private var isBottomSheetPresented = false 
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.timers.indices, id: \.self) { index in
                        NavigationLink(destination: ActivityDetailsView(timer: viewModel.timers[index])) {
                            TimerView(timer: viewModel.timers[index], onDelete: {
                                viewModel.removeTimer(at: index)
                            })
                        }
                        .listRowBackground(Color(red: 44/255, green: 44/255, blue: 44/255))
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { viewModel.removeTimer(at: $0) }
                    }
                }
                .listStyle(PlainListStyle())
                
                VStack(spacing: 10) {
                    TextField("ტაიმერის სახელი...", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    HStack {
                        TextField("სთ", value: $hours, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("წთ", value: $minutes, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("წმ", value: $seconds, formatter: numberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        guard !name.isEmpty else { return }
                        viewModel.addTimer(name: name, hours: hours, minutes: minutes, seconds: seconds)
                        name = ""
                        hours = 0
                        minutes = 0
                        seconds = 0
                    }) {
                        Text("დამატება")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("ტაიმერები")
            .navigationBarItems(trailing: Button(action: {
                isBottomSheetPresented = true
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.title2)
            })
            .background(Color(red: 44/255, green: 44/255, blue: 44/255))
            .sheet(isPresented: $isBottomSheetPresented) {
                QuickTimerSheetView(isPresented: $isBottomSheetPresented, onTimerSelect: { timerName, duration in
                    viewModel.addQuickTimer(name: timerName, duration: duration)
                })
                .presentationDetents([.medium, .large])
            }
        }
    }
    
    private func numberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximum = 59
        formatter.minimum = 0
        return formatter
    }
}
