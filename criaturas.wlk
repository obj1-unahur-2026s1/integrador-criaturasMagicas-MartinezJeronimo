import parque.*
import roles.*
import mascotas.*

class Criatura{
    const poderMagico = 10
    var rol = null
    const coloniaPerteneciente = null
    const astucia = 0
    const mascotas = []

    method coloniaPerteneciente() = coloniaPerteneciente
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

class Hada inherits Criatura{
    var property kilometrosDeVuelo = 2

    override method esAstuta() = self.astucia() > 50
    override method esFormidable() = self.esAstuta() or (self.esExtraordinario() and self.kilometrosDeVuelo() > 10)
}

class Duende inherits Criatura{
    override method poderOfensivo() = (poderMagico * 10 + self.rol().elPoderExtra()) * 1.10
    override method esFormidable() = self.esExtraordinario()
}
