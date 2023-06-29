import wollok.game.*
import soundProducer.*
import nivel.*

object manejadorDeNivel {
	const niveles =[nivelInicial, nivel1 , nivel2, nivel3, finDelJuego] 
	var property nivelActual = 0
	var currentMusic
	
	method nivelActual() {
		return niveles.get(nivelActual)
	}
	
	method cargarNivel() {
		const nivel = self.nivelActual()
		self.dibujarFondo(nivel)
		self.agregarElementos(nivel)
		self.ejecutarMusica(nivel)
		game.schedule(10, { nivel.setInputs(self)})
	}
	
	method dibujarFondo(nivel) {
		game.addVisual(nivel)
		
	}
	
	method agregarElementos(nivel) {
		nivel.agregaElementos()
	}
	
	method ejecutarMusica(nivel) {
		currentMusic = soundProducer.sound(nivel.song())
		currentMusic.volume(0.5)
		game.schedule(500, {
			currentMusic.shouldLoop(true)
			currentMusic.play()
		})
	}
	
	method avanzarNivel() {
	  	nivelActual++
	  	self.cambiarNivel()
	}
	
	method finalizarJuego() {
		nivelActual = 4
		finDelJuego.modificarPortada()
	  	game.schedule(500, {self.cambiarNivel()})
	}
	
	method reiniciarJuego() {
		nivelActual = 0
	  	game.schedule(500, {self.cambiarNivel()})
	}
	
	method cambiarNivel() {
		game.clear()
		currentMusic.stop()
		self.cargarNivel()
	}
	
	method monstruosDerrotadosPorToby(cantidad) {
		const nivel = self.nivelActual()
		if (cantidad == nivel.cantidadMonstruos()) {
			self.avanzarNivel()
		}
	}
}



