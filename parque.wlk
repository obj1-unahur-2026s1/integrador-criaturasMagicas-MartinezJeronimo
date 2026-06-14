import criaturas.*
import roles.*
import mascotas.*

class Parque {
    var property habitantes = []
    var property territorio = "tenencia legitima"

    method habitantes() = habitantes
    method ingresarHabitante(habitante) = self.habitantes().add(habitante)
    method poderDefensivo() = 0
    method poderOfensivo() = self.habitantesDeAqui().sum{n => n.poderOfensivo()}
    method habitantesDeAqui()
    method leGanaALaOtraColonia(otraColonia) {
        if (self.poderOfensivo() >= otraColonia.poderDefensivo()) {
            otraColonia.territorio("Usurpado")
            console.println("La colonia "+ self + " le usurpo el territorio de la colonia " + otraColonia)
        } else {otraColonia.habitantesDeAqui().map{n => n.poderMagico() * 0.85}
        console.println("La colonia " + otraColonia + " no pudo ser derrotada, es una pena terrible...")}
    }
}

object losClaros inherits Parque{
    
    override method habitantesDeAqui() = self.habitantes().filter{n => n.coloniaPerteneciente().toString() == "losClaros"}
    override method poderDefensivo() = 100 + self.poderOfensivo()
    override method ingresarHabitante(habitante) = if(habitante.coloniaPerteneciente().toString() == "losClaros" ) {
        self.habitantes().add(habitante)
    } else {self.error("El habitante no pertenece a esta colonia. No es xenofobia, es la realidad.")}
}

object losCastillos inherits Parque{

    override method habitantesDeAqui() = self.habitantes().filter{n => n.coloniaPerteneciente().toString() == "losCastillos"}
    method habitantesFormidables() = (self.habitantesDeAqui().filter{n => n.esFormidable()}).size()
    override method poderDefensivo() = 200 * self.habitantesFormidables()
    override method ingresarHabitante(habitante) = if(habitante.coloniaPerteneciente().toString() == "losCastillos") {
        self.habitantes().add(habitante)
    } else {self.error("El habitante no pertenece a esta colonia. No es xenofobia, es la realidad.")}
}
/*
const mauricio = new Duende(poderMagico = 17, rol = guardian, astucia = 40, coloniaPerteneciente = losCastillos)
const jorge = new Duende(poderMagico = 15, rol = domador, astucia = 10, coloniaPerteneciente = losCastillos)
const javier = new Duende(poderMagico = 15, rol = hechizero, astucia = 60, coloniaPerteneciente = losCastillos)
const irma = new Hada(poderMagico = 75, rol = hechizero, astucia = 30, coloniaPerteneciente = losClaros)
const juana = new Hada(poderMagico = 170, rol = domador, astucia = 80, coloniaPerteneciente = losClaros)
const cristina = new Hada(poderMagico = 70, rol = guardian, astucia = 80, coloniaPerteneciente = losClaros)
*/