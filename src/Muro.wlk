import wollok.game.*

class Muro{
 	const property imagenMuro = "muro.jpg"
 	var property positionX
 	var property positionY
 	
 	method position() {
 		return new Position(x = positionX, y = positionY)
 	}
 	
 	method image() {
 		return imagenMuro
 	}
 }