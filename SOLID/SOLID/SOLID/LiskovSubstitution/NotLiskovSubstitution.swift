



class Bird {
    func fly() {
        print("Bird is flying")
    }
}

class Ostrich: Bird {
    override func fly() {
        print("Ostriches can't fly!")
    }
}

//Ostrich კლასი მემკვიდრეობით იღებს Bird კლასს, მაგრამ ცვლის fly() მეთოდს არასწორად. ეს არღვევს Liskov Substitution Principle
