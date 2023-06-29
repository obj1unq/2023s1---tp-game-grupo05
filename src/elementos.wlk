import wollok.game.*
import soundProducer.*
import parametros.*

class Elemento {
	var property positionX
	var property positionY
	
	method image() 
	
	method position() {
		return new Position(x = positionX, y = positionY)
	}
	
	method chocar(personaje) {}
	
	method desaparecer() {}
}


class Hueso inherits Elemento {
	const property atravesable = true
	
	override method image() {
		return "hueso.png"
	}
	
	override method chocar(personaje) {
		personaje.comer(self)
	}
	
	override method desaparecer() {
     	game.removeVisual(self)
     	soundProducer.sound("sonidos/comiendo.mp3").play()
     } 
}


class Monstruo inherits Elemento {
	
	const property atravesable = true
	var image 
	
	const camino = []
	var property regresando = false

	override method image() {
		return image
	}
	
	override method chocar(personaje) {
		personaje.matarOMorir(self)
     }
     
    override method desaparecer() {
     	game.removeVisual(self)
     	soundProducer.sound("sonidos/monstruomuere.mp3").play()
     }
     
     method llegoAlFinalDelCamino() = camino.size() == parametros.pasosDelMonstruo()
     method llegoAlPrincipioDelCamino() = camino.isEmpty()
     
     method cambiarSentidoSiCorresponde() {
     	if (self.llegoAlFinalDelCamino()) {
     		self.regresando(true)
     	} else if (self.llegoAlPrincipioDelCamino()) {
     		self.regresando(false)
     	}
     }
     
     method obtenerSiguientePosicion() {
     	if (self.regresando()) {
     		const posicion = camino.last()
     		camino.remove(posicion)
     		return posicion
     	} else {
     		return self.obtenerSiguientePosicionLibre()
     	}
     }
     
     method obtenerSiguientePosicionLibre() {
     	const posiblesPosiciones = #{self.position().up(1), self.position().down(1), self.position().left(1), self.position().right(1)}
     	const posicionesFiltradas = posiblesPosiciones.filter({p => self.puedeIr(p)})
     	return posicionesFiltradas.anyOne()
     }
     
     method puedeIr(position) {
		return self.dentro(position) and not self.hayObstaculo(position)
	}
	
	method dentro(position) {
		return position.x().between(0, game.width()-1) and
				position.y().between(0, game.height()-1)
	}
	
	method hayObstaculo(position) {
		return not game.getObjectsIn(position).isEmpty()
	}
     
     method mover() {
     	const siguientePosicion = self.obtenerSiguientePosicion()
     	if (!self.regresando()) {
     		camino.add(self.position())
     	}
     	self.positionX(siguientePosicion.x())
     	self.positionY(siguientePosicion.y())
     	self.cambiarSentidoSiCorresponde()
     }
}


class Trampa inherits Elemento {
	const property atravesable = true
	var visible = true
	
	override method image() {
		if (visible)
			return "trampa.png"
		return "TrampaDesarmada.png"
	}
	
	method cambiar() {
		visible = !visible
	}
	
	override method chocar(personaje) {
		if (visible) {
			game.say(personaje, "¡Pisé una trampa!")
	 		personaje.perder()
	 	}  
	}	
}


class Muro inherits Elemento { 
 	const property atravesable = false
 	
 	override method image() {
 		return "muro-.png"
 	}
 }