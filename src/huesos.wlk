import wollok.game.*
import toby.*
import soundProducer.*
 
class Hueso {
	var property positionX
	var property positionY
	const property atravesable = true
	var property image= "hueso.png"
	
	method position() {
		return new Position(x = positionX, y = positionY)
	}
	
	method chocar(personaje) {
		personaje.comer()
		game.schedule(50, {
			soundProducer.sound("sonidos/comiendo.mp3").play()	
		})
		 
		game.removeVisual(self)
	}
}