



protocol Attackable {
    func attack()
}

class Warrior: Attackable {
    func attack() {
        print("Warrior attacks with a sword!")
    }
}

class Mage: Attackable {
    func attack() {
        print("Mage casts a fireball!")
    }
}

class Archer: Attackable {
    func attack() {
        print("Archer shoots an arrow!")
    }
}

class CharacterManager {
    func performAttack(character: Attackable) {
        character.attack()
    }
}

let warrior = Warrior()
let mage = Mage()
let archer = Archer()

let manager = CharacterManager()
manager.performAttack(character: warrior)
manager.performAttack(character: mage)
manager.performAttack(character: archer)  

// ვიყენებთ პროტოკოლებს გაფართოებადი სისტემის შესაქმნელად, სადაც ახალი პერსონაჟების დამატება არ საჭიროებს არსებული კოდის შეცვლას. ამის ნაცვლად, ახალი კლასები უბრალოდ შეესაბამება Attackable პროტოკოლს. აკმაყოფილებს OpenClosed_ს 

