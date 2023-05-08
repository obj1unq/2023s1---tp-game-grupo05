import mounstros.*

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