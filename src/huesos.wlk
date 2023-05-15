import wollok.game.*
 
class Hueso {
	var property positionX
	var property positionY
	const property atravesable = true
	
	method image() {
		return "hueso.png"
	}
	
	method position() {
		return new Position(x = positionX, y = positionY)
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