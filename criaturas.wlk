import roles.*
import mascotas.*

class Criatura{
    var poderMagico = 10
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
    method rol() = rol
    method poderOfensivo() = self.poderMagico() * 10 + self.rol().elPoderExtra()
    method mascotas() = mascotas
    method ingresarMascota(edad, tieneCuernos, tipoMascota) {
        if(self.rol().toString() == "domador") {
            self.mascotas().add(new Mascota(edad = edad, tieneCuernos = tieneCuernos, tipoMascota = tipoMascota))
        } else {
            self.error("No es domador, no puede tener mascotas.")
        } return console.println("Se agrego una nueva mascota!")
    }
    method ritualCambioRol() = rol.cambioDeRol(self)
    method cambiarRol(otroRol) {rol = otroRol}
}

class Hadas inherits Criatura{
    var property kilometrosDeVuelo = 2

    override method reinoPerteneciente() = Cielos 
    override method esAstuta() = self.astucia() > 50
    override method esFormidable() = self.esAstuta() or (self.esExtraordinario() and self.kilometrosDeVuelo() > 10)
}

class Duendes inherits Criatura{
    override method reinoPerteneciente() = Bosque
    override method poderOfensivo() = (poderMagico * 10 + self.rol().elPoderExtra()) * 1.10
}

 class Reinos {

 }

class Cielos inherits Reinos {

}

class Bosque inherits Reinos {

}