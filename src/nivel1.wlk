import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*
import trampas.*
import movimientosDeToby.*

object nivel1{
	
method position() = game.origin()
	
	method image() {
	 	return "fondo.png"
	 }
	 method song() {
	 	return "sonidos/nivel1.mp3"
	 }
	 
	 method ubicarMonstruos() {
	 	const monstruos = repositorioDeMonstruos.nivel1()
	 	monstruos.forEach{mounstro => game.addVisual(mounstro)}
	 }
	 
	 method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel1()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	method ubicarMuros() {
		const muros = repositorioDeMuros.nivel1()
		muros.forEach{muro => game.addVisual(muro)}
	}
	
	method ubicarTrampas(){
		const trampas = repositorioDeTrampas.nivel1()
		trampas.forEach{trampa => game.addVisual(trampa)}
	}
	method ubicarToby(){
		game.addVisual(toby)
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
}
