import wollok.game.*
import soundProducer.*
import NivelInicial.*
import nivel1.*
import nivel2.*
import nivel3.*
import finDelJuego.*


object manejadorDeNivel {
	const niveles = [nivelInicial, nivel1 , nivel2, nivel3] //, nivelUno, nivelDos, nivelTres, finDelJuego
	var nivelActual = 0
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
		//game.ground(image)
	}
	
	method agregarElementos(nivel) {
		nivel.agregaElementos()
		//game.ground(image)
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
}



