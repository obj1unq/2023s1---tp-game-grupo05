import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*
import trampas.*
import movimientosDeToby.*

object nivel2 {
	
method position() = game.origin()
	
	
	method image() {
	 	return "nivel2.png"
	 }
	 method song() {
	 	return "sonidos/nivel2.mp3"
	 }
	 
	 method ubicarMonstruos() {
	 	const monstruos = repositorioDeMonstruos.nivel2()
	 	monstruos.forEach{monstruo => game.addVisual(monstruo)}
	 }
	 
	 method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel2()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	method ubicarMuros() {
		const muros = repositorioDeMuros.nivel2()
		muros.forEach{muro => game.addVisual(muro)}
		
	}
	
	method ubicarTrampas(){
		const trampas = repositorioDeTrampas.nivel2()
		trampas.forEach{trampa => game.addVisual(trampa)}
	}
	
	
	method ubicarToby(){
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
		self.ubicarToby()
		self.ubicarTrampas()
	}
	
	method modificarPortada() {
		
	}
	
	method chocar(personaje) {
	 	
	 }
}
