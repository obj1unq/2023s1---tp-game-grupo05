import wollok.game.*

object finDelJuego {
	var property image = "fin.jpg"
	
     method position() {
     	return game.origin()
     }
	 
	 method modificarPortada() {
		image = "gameOver.jpg"
	}
	 
	 method song() {
	 	return "sonidos/portada.mp3"
	 }

	method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo{ 
			console.println("Enter")
			manejadorDeNivel.avanzarNivel()
		}
	}
	
	method agregaElementos() {
		
	}
}

