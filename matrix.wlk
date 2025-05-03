object nave {
    const pasajeros = #{neo, morfeo, trinity} //conjunto
    
    method cauntoPasajerosHay() = pasajeros.size() //cuantos pasajeros hay en la nave

    method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()}) //pasajero con mayor vitalidad 

    method pasajeroDeMenorVitalidad() = pasajeros.min({p => p.vitalidad()}) //pasajero con menor vitalidad

    method estaEquilibrada(){
        return self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad() * 2 //diferencia de vitalidad entre el pasajero con mayor y menor vitalidad
    }

    method estaElElegido() = pasajeros.any({p => p.esElElegido()}) //si hay un pasajero que es el elegido

    method chocar() {
        pasajeros.forEach({
            p => p.saltar()
        }) //cada pasajero salta
        pasajeros.clear() //se vacia la lista de pasajeros   
    }// saltan de la nave

    method acelerar() {
        pasajeros.filter({p => not p.esElElegido()}).forEach({
            p => p.saltar()
        }) //cada pasajero salta, menos el elegido
        pasajeros.remove(neo)
    }// saltan de alegria en la nave
}


object neo {
    var energia = 100

    method esElElegido() = true

    method saltar() {
        energia *= 0.5
    }

    method vitalidad() = energia * 0.1
}

object morfeo {
    var vitalidad = 8
    var estaDescansando = true

    method esElElegido() = false

    method saltar() {
        estaDescansando = not estaDescansando
        //vitalidad -= 1
        vitalidad = (vitalidad - 1).max(0)
    }

    method vitalidad() = vitalidad
}

object trinity {

    method esElElegido() = false

    method vitalidad() = 0    

    method saltar() {
        // No hace nada
    }

}