

class Warrior {
    func attack() {
        print("Warrior attacks with a sword!")
    }
}

class Mage {
    func attack() {
        print("Mage casts a fireball!")
    }
}

class Archer {
    func attack() {
        print("Archer shoots an arrow!")
    }
}

class CharacterManager {
    func attackWarrior() {
        let warrior = Warrior()
        warrior.attack()
    }
    
    func attackMage() {
        let mage = Mage()
        mage.attack()
    }
    
    func attackArcher() {
        let archer = Archer()
        archer.attack()
    }
}

let manager = CharacterManager()
manager.attackWarrior()
manager.attackMage()
manager.attackArcher()   


//არ შეესაბამება OpenClosed - ს რადგან  როცა გვსურს დავამატოთ ახალი ტიპის პერსონაჟი ან ქცევა, იძულებულნი ვართ შევცვალოთ CharacterManager კლასი.
