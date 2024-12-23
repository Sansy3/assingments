import SwiftUI

struct HoldView: View {
    @StateObject private var viewModel = HoldViewModel()

    var body: some View {
        ZStack {
            Color(red: 59 / 255, green: 119 / 255, blue: 91 / 255)
            
            ZStack {
                Circle()
                    .strokeBorder(Color.black, lineWidth: 2)

                if !viewModel.isHolding {
                    ForEach(0..<18) { i in
                        Path { path in
                            let angle = Double(i) * (360 / 18)
                            let radians = Angle(degrees: angle).radians
                            let center = CGPoint(x: 200, y: 200)
                            let radius = 200.0
                            let end = CGPoint(
                                x: center.x + radius * cos(radians),
                                y: center.y + radius * sin(radians)
                            )
                            path.move(to: center)
                            path.addLine(to: end)
                        }
                        .stroke(Color.black, lineWidth: 1)
                    }
                }
            }
            .frame(width: 400, height: 400)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                        viewModel.isHolding = true
                    }
                    .onEnded { _ in
                        viewModel.isHolding = false
                    }
            )
            .contentShape(Circle())
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    HoldView()
}
