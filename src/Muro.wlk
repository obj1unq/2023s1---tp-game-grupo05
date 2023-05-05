import wollok.game.*

class Muro{ 
 	var property positionX
 	var property positionY
 	
 	method position() {
 		return new Position(x = positionX, y = positionY)
 	}
 	
 	method image() {
 		return "muro.png"
 	}
 }