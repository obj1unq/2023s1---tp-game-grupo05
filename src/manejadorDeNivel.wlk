import wollok.game.*
import soundProducer.*
import Nivel.*
import monstruos.*
import huesos.*
import repositorioDeMuros.*
import trampas.*



object manejadorDeNivel {
	const niveles = []
	var nivelActual = 0
	var currentMusic
	
	method inicializar() {
		const inicial = new NivelInicial(imagen = "PortadaOriginal.jpg", song = "sonidos/portada.mp3")
		
		const nivel1 = new NivelLaberinto(imagen = "fondo.png", song = "sonidos/nivel1.mp3")
		nivel1.inicializarListas(repositorioDeMonstruos.nivel1(), repositorioDeHuesos.nivel1(), repositorioDeMuros.nivel1(), repositorioDeTrampas.nivel1())
		
		const nivel2 = new NivelLaberinto(imagen = "nivel2.png", song = "sonidos/nivel2.mp3")
		nivel2.inicializarListas(repositorioDeMonstruos.nivel2(), repositorioDeHuesos.nivel2(), repositorioDeMuros.nivel2(), repositorioDeTrampas.nivel2())
		
		const nivel3 = new NivelLaberinto(imagen = "nivel3.png", song = "sonidos/nivel1.mp3")
		nivel3.inicializarListas(repositorioDeMonstruos.nivel3(), repositorioDeHuesos.nivel3(), repositorioDeMuros.nivel3(), repositorioDeTrampas.nivel3())
		
		const fin = new FinDelJuego(imagen = "fin.jpg", song = "sonidos/victoria.mp3")
		
		niveles.add(inicial)
		niveles.add(nivel1)
		niveles.add(nivel2)
		niveles.add(nivel3)
		niveles.add(fin)
	}
	
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
		const fin = niveles.get(nivelActual)
		fin.cambiarAGameOver()
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
			const fin = niveles.get(4)
			fin.cambiarAVictoria()
		})
		
		game.schedule(500, {
	  		
		})
		
	}
}



