import SwiftUI

struct TrashView: View {
    @State var xPos1: CGFloat = 200
    @State var yPos1: CGFloat = 300
    
    let trashBinPosition = CGPoint(x: 325, y: 675)
    
    @State var collision: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 59 / 255, green: 119 / 255, blue: 91 / 255)            
            if !collision {
                Image("File")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .position(x: self.xPos1, y: self.yPos1)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                self.xPos1 = value.location.x
                                self.yPos1 = value.location.y
                                self.CheckCollision()
                            })
                            .onEnded { _ in
                                if !collision {
                                    self.xPos1 = 200
                                    self.yPos1 = 300
                                }
                            }
                    )
            }
            
            Image("Trash")
                .resizable()
                .frame(width: 50, height: 50)
                .position(trashBinPosition)
        }
    }
    
    func CheckCollision() {
        let trashBinRect = CGRect(
            x: trashBinPosition.x - 25,
            y: trashBinPosition.y - 25,
            width: 50,
            height: 50
        )
        
        if trashBinRect.contains(CGPoint(x: xPos1, y: yPos1)) {
            self.collision = true
        } else {
            self.collision = false
        }
    }
}

#Preview {
    TrashView()
}
