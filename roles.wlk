import mascotas.*
import criaturas.*

class Roles {
    method elPoderExtra() = 0
    method esExtraordinario(criatura) = false
}

object guardian inherits Roles { 
    override method elPoderExtra() = 100
    override method esExtraordinario(criatura) = criatura.poderMagico() > 50
}

object hechizero inherits Roles{
    override method esExtraordinario(criatura) = true
}

object domador inherits Roles{
    var property mascotasConCuernos = 0

    override method elPoderExtra() = 150 * mascotasConCuernos
    override method esExtraordinario(criatura) = criatura.poderMagico() >= 15 and criatura.mascotas().all {n => n.edad() >= 10}

}