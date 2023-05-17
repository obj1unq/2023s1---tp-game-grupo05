import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*
import trampas.*
import movimientosDeToby.*

object nivel3{
	
method position() = game.origin()
	
	
	method image() {
	 	return "nivel3.png"
	 }
	 method song() {
	 	return "sonidos/nivel2.mp3"
	 }
	 
	 method ubicarMonstruos() {
	 	const monstruos = repositorioDeMonstruos.nivel3()
	 	monstruos.forEach{monstruo => game.addVisual(monstruo)}
	 }
	 
	 method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel3()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	method ubicarMuros() {
		const muros = repositorioDeMuros.nivel3()
		muros.forEach{muro => game.addVisual(muro)}
	}
		
	method ubicarTrampas(){
		const trampas = repositorioDeTrampas.nivel3()
		trampas.forEach{trampa => game.addVisual(trampa)}
	}
	
	method ubicarToby(){
		toby.position(game.at(0,0))
		toby.orientacion(arriba)
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
