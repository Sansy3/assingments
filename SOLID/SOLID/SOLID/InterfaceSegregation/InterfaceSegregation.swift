protocol EnginePowered {
    func startEngine()
}

protocol Drivable {
    func drive()
}

protocol Sailable {
    func sail()
}

class Car: EnginePowered, Drivable {
    func startEngine() {
        print("Car engine starting")
    }
    
    func drive() {
        print("Car driving")
    }
}

class Boat: EnginePowered, Sailable {
    func startEngine() {
        print("Boat engine starting")
    }
    
    func sail() {
        print("Boat sailing")
    }
}

//ინტერფეისი დაყოფილია პატარ პატარა ნაწილებად.  კლასები იყენებენ მხოლოდ იმ მეთოდებს რომლებიც მათ ნამდვილად სჭირდებათ. 
