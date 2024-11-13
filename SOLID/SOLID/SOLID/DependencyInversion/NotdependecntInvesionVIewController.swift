


class HipHopDance {
    func perform() {
        print("Dancing hip hop style!")
    }
}

class AcharuliDance {
    func perform() {
        print("Dancing Acharuli style!")
    }
}

class Dancer {
    let hipHopDance: HipHopDance
    let acharuliDance: AcharuliDance
    
    init(hipHopDance: HipHopDance, acharuliDance: AcharuliDance) {
        self.hipHopDance = hipHopDance
        self.acharuliDance = acharuliDance
    }
    
    func performHipHop() {
        hipHopDance.perform()
    }
    
    func performAcharuli() {
        acharuliDance.perform()
    }
}


// კოდში არ არის (DIP), რადგან მაღალი დონე Dancer კლასი პირდაპირ არის დამოკიდებული კონკრეტული დაბალი დონის კლასებზე, როგორიცაა HipHopDance და AcharuliDance.
