protocol Vehicle {
    func startEngine()
    func drive()
    func sail()
}

class Car: Vehicle {
    func startEngine() {
        print("Car engine starting")
    }
    
    func drive() {
        print("Car driving")
    }
    
    func sail() {
        fatalError("Cars can't sail!")
    }
}

class Boat: Vehicle {
    func startEngine() {
        print("Boat engine starting")
    }
    
    func drive() {
        fatalError("Boats can't drive!")
    }
    
    func sail() {
        print("Boat sailing")
    }
}

//კლასებს უწევთ მეთოდების შესრულება რომლებიც მათ არ სჭირდებათ. არ უნდა მიეწოდოს რთული ან არასწორად გასაგები ინტერფეისები
