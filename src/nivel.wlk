import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*
import trampas.*
import movimientosDeToby.*

class Nivel {
	
	method position() {
		return game.origin()
	}
	
	method image()
	 
	method song()
	
	method setInputs(manejadorDeNivel) 
	
	method agregaElementos() {
		
	}
	
}


class NivelLaberinto inherits Nivel {
	
	override method song() {
		return "sonidos/nivel1.mp3"
	}
	
	method chocar(personaje) {}
	 
	method ubicar(objetosAUbicar) {
	 	objetosAUbicar.forEach{objeto => game.addVisual(objeto)}
	}
	 
	method ubicarToby(){
		toby.position(game.at(0,0))
		toby.orientacion(derecha)
		game.addVisual(toby)
		game.onCollideDo(toby, {visualColisionado => visualColisionado.chocar(toby)})
	}
	
	override method setInputs(manejadorDeNivel) {
		keyboard.space().onPressDo{ manejadorDeNivel.avanzarNivel() }
		movimientosDeToby.registrarMovimientos()
	}
	
	override method agregaElementos() {
		self.ubicarToby()
	}
}


object nivel1 inherits NivelLaberinto {

	override method image() {
	 	return "fondo.png"
	 }
	 
	 override method agregaElementos() {
	 	super()
	 	self.ubicar(repositorioDeMonstruos.nivel1())
	 	self.ubicar(repositorioDeHuesos.nivel1())
	 	self.ubicar(repositorioDeMuros.nivel1())
	 	self.ubicar(repositorioDeTrampas.nivel1())
	 }
}


object nivel2 inherits NivelLaberinto {
	
	override method image() {
	 	return "nivel2.png"
	 }
	
	 override method agregaElementos() {
	 	super()
	 	self.ubicar(repositorioDeMonstruos.nivel2())
	 	self.ubicar(repositorioDeHuesos.nivel2())
	 	self.ubicar(repositorioDeMuros.nivel2())
	 	self.ubicar(repositorioDeTrampas.nivel2())
	 }
}


object nivel3 inherits NivelLaberinto {
	
	override method image() {
	 	return "nivel3.png"
	 }
	
	 override method agregaElementos() {
	 	super()
	 	self.ubicar(repositorioDeMonstruos.nivel3())
	 	self.ubicar(repositorioDeHuesos.nivel3())
	 	self.ubicar(repositorioDeMuros.nivel3())
	 	self.ubicar(repositorioDeTrampas.nivel3())
	 }
}


object finDelJuego inherits Nivel {
	var imagen = "fin.jpg"
	
	override method image() {
		return imagen
	}
	 
	 method modificarPortada() {
		imagen = "gameOver.jpg"
	}
	 
	 override method song() {
	 	return "sonidos/gameover.mp3"
	 }

	override method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo{ 
			manejadorDeNivel.reiniciarJuego()
		}
	}
	
}


object nivelInicial inherits Nivel {
	
	 override method image() {
	 	return "PortadaOriginal.jpg"
	 }
	 
	 override method song() {
	 	return "sonidos/portada.mp3"
	 }

	override method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo { 
			console.println("Enter")
			manejadorDeNivel.avanzarNivel()
		}
	}
	
	method modificarPortada() {
		
	}
}