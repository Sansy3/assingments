


class IngredientPreparer {
    func prepare() {
        print("Preparing ingredients")
    }
}

class Cook {
    func cook() {
        print("Cooking food")
    }
}

class Server {
    func serve() {
        print("Serving food")
    }
}

class Cleaner {
    func clean() {
        print("Cleaning up")
    }
}


// აკმაყოფილებს singleResponsibility_ს  რადგან ახლა თითოეულ კლასს აქვს ერთი მკაფიო პასუხისმგებლობა: ინგრედიენტების მომზადება, მომზადება, მომსახურება ან გაწმენდა.
