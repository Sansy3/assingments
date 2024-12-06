import SwiftUI

struct CardView: View {
    @State private var isOnline: Bool = true

    let skills = ["SwiftUI", "iOS Development", "Problem Solving", "UI/UX Design"]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .cornerRadius(40)
                .padding()

            VStack(spacing: 20) {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 10)
                                .frame(width: 110, height: 110)

                            Image("CUTIE")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        }

                        Text(isOnline ? "Online" : "Offline")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(6)
                            .background(isOnline ? Color.green : Color.red)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .offset(x: 10, y: 10)
                    }

                    Text("John Doe")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                    Text("iOS Developer")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }

                HStack(spacing: 20) {
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.3))
                                .frame(width: 50, height: 50)

                            Image(systemName: "phone.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.3))
                                .frame(width: 50, height: 50)

                            Image(systemName: "envelope.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                        }
                    }
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.3))
                                .frame(width: 50, height: 50)

                            Image(systemName: "globe")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Skills")
                        .font(.headline)
                        .foregroundColor(.white)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(skills, id: \.self) { skill in
                            Text("• \(skill)")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.leading, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 50)
                        .frame(width: 160)
                        

                    Toggle(isOn: $isOnline) {
                        Text("Set Offline")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                    .padding(.horizontal, 65)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 30)
            }
            .padding([.top, .leading, .trailing])
            .padding(.bottom, 30)
            .padding(.top, 30)
        }
        .frame(width: 300, height: 491)
    }
}


struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            CardView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
