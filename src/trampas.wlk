import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*


class Trampa {
	var property positionX
	var property positionY
	const property atravesable = true
	
	method position() {
		return new Position (x = positionX, y = positionY)
	}
	
	method image() {
		return "trampa.png"
	}
}

object repositorioDeTrampas {
	
	method nivel1(){
	const trampas = []
		
		trampas.add(new Trampa(positionX=5,positionY=6))
		trampas.add(new Trampa(positionX=1,positionY=4))
		trampas.add(new Trampa(positionX=8,positionY=3))
		
		return trampas
		
	}
}