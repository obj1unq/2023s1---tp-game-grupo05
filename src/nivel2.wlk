import wollok.game.*
import toby.*
import Muro.* 
import mounstros.*
import repositorioDeMuros.*
import repositorioDeMounstros.*

object nivel2{
	
method position() = game.origin()
	
	
	method image() {
	 	return "nivel2.png"
	 }
	 method song() {
	 	return "sonidos/nivel2.mp3"
	 }
	 
	 method ubicarMounstros() {
	 	const mounstros = repositorioDeMounstros.nivel2()
	 	mounstros.forEach{mounstro => game.addVisual(mounstro)}
	 }
	
	method ubicarMuros() {
		const muros = repositorioDeMuros.nivel2()
		muros.forEach{muro => game.addVisual(muro)}
	}
	
	method setInputs(manejadorDeNivel) {
		keyboard.space().onPressDo{ manejadorDeNivel.avanzarNivel() }
	}
	
	method agregaElementos() {
		self.ubicarMuros()
		self.ubicarMounstros()
	}
}