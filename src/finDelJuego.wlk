import wollok.game.*

object finDelJuego {
	
     method position() = game.origin()
	
	 method image() {
	 
	 	return "fondo.jpg"
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

