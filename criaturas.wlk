import roles.*

class Criatura{
    var poderMagico = null
    var rol = null
    var reinoPerteneciente = null
    var astucia = 0

    method reinoPerteneciente() = reinoPerteneciente
    method poderMagico() = poderMagico
    method astucia() = astucia
    method esAstuta() = false
    method rolParque() = rol
    method poderOfensivo() = poderMagico * 10 + self.rolParque().elPoderExtra()
    method esFormidable() = false
}

class Hadas inherits Criatura{
    var kilometrosDeVuelo = 2

    override method reinoPerteneciente() = Cielos
    method kilometrosDeVuelo() = kilometrosDeVuelo 
    override method esAstuta() = self.astucia() > 50
}

class Duendes inherits Criatura{
    override method reinoPerteneciente() = Bosque
    override method poderOfensivo() = (poderMagico * 10 + self.rolParque().elPoderExtra()) * 1.10
}

 class Reinos {

 }

class Cielos inherits Reinos {

}

class Bosque inherits Reinos {

}