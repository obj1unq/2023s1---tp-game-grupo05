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

		if (visible) {
			game.say(personaje, "¡Pisé una trampa!")
			soundProducer.sound("sonidos/muerte.mp3").play()
	 		personaje.perder()
	 	} 
		  
	}	
}


object repositorioDeTrampas {
	
	method nivel1() {
		const trampas = []
		trampas.add(new Trampa(positionX = 15, positionY = 1))
		trampas.add(new Trampa(positionX = 5, positionY = 8))
		trampas.add(new Trampa(positionX = 3, positionY = 13))
		
		return trampas
	}
	
	method nivel2() {
	const trampas = []
		
		trampas.add(new Trampa(positionX = 15, positionY = 3))
		trampas.add(new Trampa(positionX = 1, positionY = 10))
		trampas.add(new Trampa(positionX = 4, positionY = 15))
				
		return trampas
	}
	
	method nivel3() {
	const trampas = []
		
		trampas.add(new Trampa(positionX = 11, positionY = 6))
		trampas.add(new Trampa(positionX = 9, positionY = 13))
		trampas.add(new Trampa(positionX = 4, positionY = 2))
				
		return trampas
	}
}