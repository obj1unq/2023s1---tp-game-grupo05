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
	
	 method song() {
	 	return "sonidos/nivel1.mp3"
	 }
	 
	 method chocar(personaje) {
	 	
	 }
	 
	 method ubicarMonstruos()
	 
	 method ubicarHuesos()
	 
	 method ubicarMuros()
	 
	 method ubicarTrampas()
	 
	 method ubicarToby(){
		toby.position(game.at(0,0))
		toby.orientacion(derecha)
		game.addVisual(toby)
		game.onCollideDo(toby, {visualColisionado => visualColisionado.chocar(toby)})
	}
	
	method setInputs(manejadorDeNivel) {
		keyboard.space().onPressDo{ manejadorDeNivel.avanzarNivel() }
		movimientosDeToby.registrarMovimientos()
	}
	
	method agregaElementos() {
		self.ubicarMuros()
		self.ubicarMonstruos()
		self.ubicarHuesos()
		self.ubicarTrampas()
		self.ubicarToby()
	}
	
	method modificarPortada() {
		
	}
}


object nivel1 inherits Nivel {
	
	override method image() {
	 	return "fondo.png"
	 }
	
	 override method ubicarMonstruos() {
	 	const monstruos = repositorioDeMonstruos.nivel1()
	 	monstruos.forEach{monstruo => game.addVisual(monstruo)}
	 }
	 
	 override method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel1()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	override method ubicarMuros() {
		const muros = repositorioDeMuros.nivel1()
		muros.forEach{muro => game.addVisual(muro)}
	}
	
	override method ubicarTrampas(){
		const trampas = repositorioDeTrampas.nivel1()
		trampas.forEach{trampa => game.addVisual(trampa)}
	}
}


object nivel2 inherits Nivel {
	
	override method image() {
	 	return "nivel2.png"
	 }
	
	 override method ubicarMonstruos() {
	 	const monstruos = repositorioDeMonstruos.nivel2()
	 	monstruos.forEach{monstruo => game.addVisual(monstruo)}
	 }
	 
	 override method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel2()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	override method ubicarMuros() {
		const muros = repositorioDeMuros.nivel2()
		muros.forEach{muro => game.addVisual(muro)}
	}
	
	override method ubicarTrampas(){
		const trampas = repositorioDeTrampas.nivel2()
		trampas.forEach{trampa => game.addVisual(trampa)}
	}
}


object nivel3 inherits Nivel {
	
	override method image() {
	 	return "nivel3.png"
	 }
	
	 override method ubicarMonstruos() {
	 	const monstruos = repositorioDeMonstruos.nivel3()
	 	monstruos.forEach{monstruo => game.addVisual(monstruo)}
	 }
	 
	 override method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel3()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	override method ubicarMuros() {
		const muros = repositorioDeMuros.nivel3()
		muros.forEach{muro => game.addVisual(muro)}
	}
	
	override method ubicarTrampas(){
		const trampas = repositorioDeTrampas.nivel3()
		trampas.forEach{trampa => game.addVisual(trampa)}
	}
}
