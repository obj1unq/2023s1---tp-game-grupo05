import wollok.game.*
import toby.*
import mounstros.*
import huesos.*
import Muro.*
import repositorioDeMuros.*

object nivel1{
	
method position() = game.origin()
	
	method image() {
	 	return "nivel1.png"
	 }
	 method song() {
	 	return "sonidos/nivel1.mp3"
	 }
	 
	 method ubicarMounstros() {
	 	const mounstros = repositorioDeMounstros.nivel1()
	 	mounstros.forEach{mounstro => game.addVisual(mounstro)}
	 }
	 
	 method ubicarHuesos() {
	 	const huesos = repositorioDeHuesos.nivel1()
	 	huesos.forEach{hueso => game.addVisual(hueso)}
	 }
	
	method ubicarMuros() {
		const muros = repositorioDeMuros.nivel1()
		muros.forEach{muro => game.addVisual(muro)}
	}
	method ubicarToby(){
		game.addVisual(toby)
	}
	
	method setInputs(manejadorDeNivel) {
		keyboard.space().onPressDo{ manejadorDeNivel.avanzarNivel() }
		keyboard.up().onPressDo({ toby.mover(arriba, 1) })
	keyboard.down().onPressDo({ toby.mover(abajo, 1) })
	keyboard.left().onPressDo({ toby.mover(izquierda, 1)})
	keyboard.right().onPressDo({ toby.mover(derecha, 1)})
	}
	
	method agregaElementos() {
		self.ubicarMuros()
		self.ubicarMounstros()
		self.ubicarHuesos()
		self.ubicarToby()
	}
}
