protocol DanceStyle {
    func perform()
}

class HipHopDance: DanceStyle {
    func perform() {
        print("Dancing hip hop style!")
    }
}

class AcharuliDance: DanceStyle {
    func perform() {
        print("Dancing Acharuli style!")
    }
}

class Dancer {
    let danceStyle: DanceStyle
    
    init(danceStyle: DanceStyle) {
        self.danceStyle = danceStyle
    }
    
    func performDance() {
        danceStyle.perform()
    }
}

//DIP დაცულია რადგან HipHopDance და AcharuliDance გამომდინარეობს საერთო პროტოკოლისგან DanceStyle
