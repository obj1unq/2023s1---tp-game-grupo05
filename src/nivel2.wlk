import wollok.game.*
import toby.*
import Muro.*
import repositorioDeMuros.*

object nivel2{
	
method position() = game.origin()
	
	
	method image() {
	 	return "nivel2.png"
	 }
	 method song() {
	 	return "sonidos/nivel2.mp3"
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
	}
}