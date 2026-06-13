import mascotas.*
import criaturas.*

class Roles {
    method elPoderExtra() = 0
    method esExtraordinario(criatura) = false
    method cambioDeRol(criatura)
}

object guardian inherits Roles { 
    override method elPoderExtra() = 100
    override method esExtraordinario(criatura) = criatura.poderMagico() > 50
    override method cambioDeRol(criatura) = if (criatura.rol().toString() == "guardian") {
        criatura.cambiarRol(domador)
        criatura.ingresarMascota(1, false, "Mítologica")
    }
}

object hechizero inherits Roles{
    override method esExtraordinario(criatura) = true
    override method cambioDeRol(criatura) = if (criatura.rol().toString() == "hechizero") {
        criatura.cambiarRol(guardian)
    }
}

object domador inherits Roles{
    var property mascotasConCuernos = 0

    override method elPoderExtra() = 150 * mascotasConCuernos
    override method esExtraordinario(criatura) = criatura.poderMagico() >= 15 and criatura.mascotas().all {n => n.edad() >= 10}
    override method cambioDeRol(criatura) = if (criatura.rol().toString() == "domador" and criatura.mascotas().any{n => n.tieneCuernos().toString() == "false" and n.tipoMascota().toString() == "magica"} ) {
        criatura.cambiarRol(hechizero)
    } else {self.error("No posee los requisitos necesarios para cambiar de rol")}

}