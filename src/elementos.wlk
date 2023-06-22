import wollok.game.*
import soundProducer.*

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