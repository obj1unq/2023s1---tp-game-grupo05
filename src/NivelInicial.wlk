import wollok.game.*

object nivelInicial {
	
     method position() = game.origin()
	
	 method image() {
	 
	 	return "PortadaOriginal.jpg"
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

