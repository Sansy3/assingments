import SwiftUI

struct SpinView: View {
    @StateObject private var viewModel = SpinViewModel()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 59 / 255, green: 119 / 255, blue: 91 / 255, opacity: 1)
                
                VStack {
                    ZStack {
                        WheelView()
                            .rotationEffect(.degrees(viewModel.rotation))
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        viewModel.spinWheel(translation: value.translation)
                                    }
                            )
                            .frame(width: geometry.size.width, height: geometry.size.width)
                    }
                    Text("Swipe down to spin")
                        .font(.headline)
                        .padding()
                }
            }
        }
    }
}

struct WheelView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.width
            let center = CGPoint(x: size / 2, y: size / 2)
            let radius = size / 2
            let spokeCount = 20
            
            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .background(Circle().fill(Color.white))
                
                ForEach(0..<spokeCount, id: \.self) { index in
                    let angle = Angle.degrees(Double(index) * (360.0 / Double(spokeCount)))
                    Path { path in
                        path.move(to: center)
                        path.addLine(to: CGPoint(
                            x: center.x + radius * cos(angle.radians),
                            y: center.y + radius * sin(angle.radians)
                        ))
                    }
                    .stroke(Color.black, lineWidth: 1)
                }
            }
        }
    }
}

#Preview {
    SpinView()
}
