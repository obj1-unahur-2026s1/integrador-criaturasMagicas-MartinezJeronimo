class Roles {
    method elPoderExtra() = 0
}

object guardian inherits Roles {
    override method elPoderExtra() = 100
}

object hechizero inherits Roles{
    
}

object domador inherits Roles{
    var property mascotasConCuernos = 0
    override method elPoderExtra() = 150 * mascotasConCuernos
}