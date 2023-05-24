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

object repositorioDeHuesos {
	
	method nivel1() {
 	const huesos  = []
 	
 	huesos.add(new Hueso(positionX = 13, positionY = 3))
 	huesos.add(new Hueso(positionX = 0, positionY = 8))
 	huesos.add(new Hueso(positionX = 0, positionY = 14))
 	
 	return huesos
	}
	
	
	method nivel2() {
 	const huesos  = []
 	
 	huesos.add(new Hueso(positionX = 15, positionY = 0))
 	huesos.add(new Hueso(positionX = 0, positionY = 14))
 	huesos.add(new Hueso(positionX = 0, positionY = 8))
 	
 	return huesos
	}
	
	
	method nivel3() {
 	const huesos  = []
 	
 	huesos.add(new Hueso(positionX = 8, positionY = 2))
 	huesos.add(new Hueso(positionX = 15, positionY = 0))
 	huesos.add(new Hueso(positionX = 12, positionY = 7))
 	
 	return huesos
	}
}