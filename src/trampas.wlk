import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*
import soundProducer.*


class Trampa {
	
	var property positionX
	var property positionY
	const property atravesable = true
	
	var visible = true
	
	method position() {
		return new Position (x = positionX, y = positionY)
	}
	method image() {
		if (visible)
			return "trampa.png"
		return "TrampaDesarmada.png"
	}
	
	method cambiar() {
		visible = !visible
	}
	
	method chocar(personaje) {
		console.println(visible)
		if (visible) {
			game.say(personaje, "¡Pisé una trampa!")
			soundProducer.sound("sonidos/muerte.mp3").play()
	 		personaje.perder()
	 	} 
		  
	}	
}
