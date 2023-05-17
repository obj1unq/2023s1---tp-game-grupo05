import wollok.game.*
import toby.*


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
		 } else { 
		 	game.say(self, "¡Necesitas un hueso para matarme!")
		 	personaje.perder()
		 }
     } 	
}


object repositorioDeMonstruos {
	
	method nivel1() {
 	const monstruos  = []
 	
 	monstruos.add(new Monstruo(image="monstruo1.png", positionX = 6, positionY = 4 ))
    monstruos.add(new Monstruo(image="monstruo2.png", positionX = 7, positionY = 6 ))
    monstruos.add(new Monstruo(image="monstruo3.png", positionX = 3, positionY = 15))	
 	
 	return monstruos
	}
	
	
	method nivel2() {
 	const monstruos  = []
 	
 	monstruos.add(new Monstruo(image="monstruo1.png", positionX = 8, positionY = 9))
    monstruos.add(new Monstruo(image="monstruo2.png", positionX = 8, positionY = 1))
    monstruos.add(new Monstruo(image="monstruo3.png", positionX = 7, positionY = 12))	
 	
 	return monstruos
	}
	
	
	method nivel3() {
 	const monstruos  = []
 	
 	monstruos.add(new Monstruo(image="monstruo1.png", positionX = 10, positionY = 10))
    monstruos.add(new Monstruo(image="monstruo2.png", positionX = 0, positionY = 12))
    monstruos.add(new Monstruo(image="monstruo3.png", positionX = 15, positionY = 14))	
    
 	return monstruos
	}
}