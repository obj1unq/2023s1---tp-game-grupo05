import wollok.game.*
import toby.*
import monstruos.*
import huesos.*
import Muro.*
import repositorioDeMuros.*
import trampas.*
import movimientosDeToby.*

class Nivel {
	 var imagen 
	  var song
	
	method position() {
		return game.origin()
	}
	
	method image(){
		return imagen
	}
	 
	method song() {	
		return song
	}
	
	method setInputs(manejadorDeNivel) 
	
	method agregaElementos() {
		
	}
}


class NivelLaberinto inherits Nivel {
	const monstruos = []
	const huesos = []
	const muros = []
	const trampas = []
	
	method inicializarListas(_monstruos, _huesos, _muros, _trampas) {
		monstruos.addAll(_monstruos)
		huesos.addAll(_huesos)
		muros.addAll(_muros)
		trampas.addAll(_trampas)
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
		movimientosDeToby.registrarMovimientos()
	}
	
	override method agregaElementos() {
		self.ubicar(monstruos)
	 	self.ubicar(huesos)
	 	self.ubicar(muros)
	 	trampas.forEach{t => game.onTick(3000,"sacarTrampa",{ t.cambiar() })}
	 	self.ubicar(trampas)
	 	self.ubicarToby()
	}
}

class NivelMenu inherits Nivel {
	method cambiarAGameOver() {
		
	}
	
	method cambiarAVictoria() {
		
	}
}

class NivelInicial inherits NivelMenu {
	override method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo { 
			manejadorDeNivel.avanzarNivel()
		}
	}
}

class FinDelJuego inherits NivelMenu {
	 override method cambiarAGameOver() {
		imagen = "gameOver.jpg"
		song = "sonidos/gameover.mp3"
	}
	
	override method cambiarAVictoria() {
		imagen = "fin.jpg"
		song = "sonidos/victoria.mp3"
	}

	override method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo{ 
			manejadorDeNivel.reiniciarJuego()
		}
	}
}