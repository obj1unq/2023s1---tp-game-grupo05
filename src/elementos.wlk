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
}


class Hueso inherits Elemento {
	const property atravesable = true
	
	override method image() {
		return "hueso.png"
	}
	
	override method chocar(personaje) {
		personaje.comer()
		game.schedule(50, {soundProducer.sound("sonidos/comiendo.mp3").play()})
		game.removeVisual(self)
	}
}


class Monstruo inherits Elemento {
	const property atravesable = true
	var image 

	override method image() {
		return image
	}
	
	override method chocar(personaje) {
		if (personaje.cantidadDeHuesos() >= 1) {
			game.removeVisual(self)
			personaje.eliminarMonstruos()
		   soundProducer.sound("sonidos/monstruomuere.mp3").play()
		 } else { 
		 	game.say(self, "¡Necesitas un hueso para matarme!")
			soundProducer.sound("sonidos/muerte.mp3").play()
		 	personaje.perder()
		 }
		
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
		console.println(visible)
		if (visible) {
			game.say(personaje, "¡Pisé una trampa!")
			soundProducer.sound("sonidos/muerte.mp3").play()
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