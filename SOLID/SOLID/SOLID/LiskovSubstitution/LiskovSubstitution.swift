



class Bird {
    func move() {
        print("Bird is moving")
    }
}

class FlyingBird: Bird {
    override func move() {
        print("Flying bird is flying")
    }
}

class Ostrich: Bird {
    override func move() {
        print("Ostrich is running")
    }
}


//ეს მიდგომა უზრუნველყოფს იმას, რომ LSP დაცულია.
//როდესაც Bird-ს კლასის ობიექტს ვცვლით FlyingBird ან Ostrich-ით, ქცევა მაინც იქნება სწორი და პროგნოზირებადი.
