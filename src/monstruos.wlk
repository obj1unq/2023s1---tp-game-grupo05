import wollok.game.*
import toby.*
import soundProducer.*


class Monstruo {
	var property positionX
	var property positionY
	var property image
	const property atravesable = true

	
	method position() {
		return new Position(x = positionX, y = positionY)
	}
	
	method chocar(personaje) {
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
