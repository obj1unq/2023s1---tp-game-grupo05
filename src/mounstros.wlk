import wollok.game.*

class Mounstro1 {
	var property positionX
	var property positionY
	
	method image() {
		return "mounstro1.png"
	}
	
	method position() {
		return new Position(x = positionX, y = positionY)
	}
}


class Mounstro2 {
	var property positionX
	var property positionY
	
	method image() {
		return "mounstro2.png"
	}
	
	method position() {
		return new Position(x = positionX, y = positionY)
	}
}


class Mounstro3 {
	var property positionX
	var property positionY
	
	method image() {
		return "mounstro3.png"
	}
	
	method position() {
		return new Position(x = positionX, y = positionY)
	}
}



object repositorioDeMounstros {
	
	method nivel1() {
 	const mounstros  = []
 	
 	mounstros.add(new Mounstro1(positionX = 6, positionY = 4))
 	mounstros.add(new Mounstro2(positionX = 7, positionY = 6))
 	mounstros.add(new Mounstro3(positionX = 3, positionY = 15))
 	
 	return mounstros
	}
	
	
	method nivel2() {
 	const mounstros  = []
 	
 	mounstros.add(new Mounstro1(positionX = 8, positionY = 9))
 	mounstros.add(new Mounstro2(positionX = 0, positionY = 10))
 	mounstros.add(new Mounstro3(positionX = 7, positionY = 12))
 	
 	return mounstros
	}
	
	
	method nivel3() {
 	const mounstros  = []
 	
 	mounstros.add(new Mounstro1(positionX = 10, positionY = 10))
 	mounstros.add(new Mounstro2(positionX = 0, positionY = 12))
 	mounstros.add(new Mounstro3(positionX = 15, positionY = 14))
 	
 	return mounstros
	}
}