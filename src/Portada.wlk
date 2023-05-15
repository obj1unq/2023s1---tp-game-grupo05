import wollok.game.*
import soundProducer.*

object imagenDePortada {

	method image() {
		return "portada.jpg" 
	}
	
	method iniciarJuego(){
		soundProducer.sound("sonidos/portada.mp3").play()
		game.start()
	}	
}