import wollok.game.*
import soundProducer.*
import nivel.*

object manejadorDeNivel {
	const niveles =[nivelInicial, nivel1 , nivel2, nivel3, finDelJuego] 
	var property nivelActual = 0
	var currentMusic
	
	method cargarNivel() {
		const nivel = niveles.get(nivelActual)
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
	  	game.clear()
	  	currentMusic.stop()
	  	self.cargarNivel()
	}
	
	method finalizarJuego() {
		nivelActual = 4
		finDelJuego.modificarPortada()
	  	game.schedule(500, {
	  		game.clear()
			currentMusic.stop()
			self.cargarNivel()
		})
	}
	
	method reiniciarJuego() {
		nivelActual = 0
	  	game.schedule(500, {
	  		game.clear()
			currentMusic.stop()
			self.cargarNivel()
		})
	}
}



