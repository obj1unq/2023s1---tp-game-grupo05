import wollok.game.*
import toby.*
import Muro.*
import repositorioDeMuros.*

object nivel1{
	
method position() = game.origin()
	
	
	method image() {
	 	return "nivel1.png"
	 }
	 method song() {
	 	return "sonidos/juego.mp3"
	 }
	
	method ubicarMuros() {
		const muros = repositorioDeMuros.nivel1()
		muros.forEach{muro => game.addVisual(muro)}
	}
	
	method setInputs(manejadorDeNivel) {
		keyboard.space().onPressDo{ game.stop() }
	}
	
	method agregaElementos() {
		self.ubicarMuros()
	}
}
