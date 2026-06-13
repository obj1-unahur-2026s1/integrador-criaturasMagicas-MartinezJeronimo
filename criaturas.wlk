import roles.*
import mascotas.*

class Criatura{
    var poderMagico = 0
    var rol = null
    var reinoPerteneciente = null
    var astucia = 0
    var mascotas = []

    method reinoPerteneciente() = reinoPerteneciente
    method poderMagico() = poderMagico
    method astucia() = astucia
    method esAstuta() = false
    method esExtraordinario() = rol.esExtraordinario(self)
    method esFormidable() = self.esAstuta() or self.esExtraordinario()
    method rolParque() = rol
    method poderOfensivo() = poderMagico * 10 + self.rolParque().elPoderExtra()
    method mascotas() = mascotas
    method ingresarMascota(edad, tieneCuernos) {
        if(self.rolParque().toString() == "domador") {
            self.mascotas().add(new Mascotas(edad = edad, tieneCuernos = tieneCuernos))
        } else {
            self.error("No es domador, no puede tener mascotas.")
        }
    }
}

class Hadas inherits Criatura{
    var property kilometrosDeVuelo = 2

    override method reinoPerteneciente() = Cielos 
    override method esAstuta() = self.astucia() > 50
    override method esFormidable() = self.esAstuta() or (self.esExtraordinario() and self.kilometrosDeVuelo() > 10)
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