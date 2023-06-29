import wollok.game.*
import toby.*
import elementos.*
import repositorioDeMuros.*
import movimientosDeToby.*

class Nivel {
	
	method position() {
		return game.origin()
	}
	
	method image()
	 
	method song()
	
	method setInputs(manejadorDeNivel) 
	
	method agregaElementos() {}
}


class NivelLaberinto inherits Nivel {
	
	var property cantidadMonstruos = 0
	
	override method song() {
		return "sonidos/nivel1.mp3"
	}
	
	override method setInputs(manejadorDeNivel) {
		keyboard.space().onPressDo{ manejadorDeNivel.avanzarNivel() }
		movimientosDeToby.registrarMovimientos()
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
		toby.inicializar()
	}
	
	override method agregaElementos() {
		self.ubicar(self.describirHuesos())
		const monstruos = self.describirMonstruos()
		cantidadMonstruos = monstruos.size()
		self.ubicar(monstruos)
		self.ubicar(self.describirTrampas())
		self.ubicar(self.describirMuro())
		self.ubicarToby()
	}
	
	method describirHuesos()
	
	method describirMonstruos()
	
	method describirTrampas()
	
	method describirMuro()
}


object nivel1 inherits NivelLaberinto {

	override method image() {
	 	return "fondo.png"
	 }
	 
	 override method describirHuesos() {
	 	const huesos  = []
 	
 		huesos.add(new Hueso(positionX = 13, positionY = 3))
 		huesos.add(new Hueso(positionX = 0, positionY = 14))
 	
 		return huesos
	 }
	 
	 override method describirMonstruos() {
	 	const monstruos  = []
 	
	    monstruos.add(new Monstruo(image="monstruo2.png", positionX = 7, positionY = 6 ))
	    monstruos.add(new Monstruo(image="monstruo3.png", positionX = 3, positionY = 15))	
	 	
	 	return monstruos
	 }
	 
	 override method describirTrampas() {
	 	const trampas = []
	 	
		trampas.add(new Trampa(positionX = 15, positionY = 1))
		trampas.add(new Trampa(positionX = 5, positionY = 8))
		trampas.add(new Trampa(positionX = 3, positionY = 13))
		
		trampas.forEach{t => game.onTick(3000,"sacarTrampa",{ t.cambiar() })}
		
		return trampas
	 }
	 
	 override method describirMuro() {
	 	return repositorioDeMuros.nivel1()
	 }
}


object nivel2 inherits NivelLaberinto {
	
	override method image() {
	 	return "nivel2.png"
	 }
	
	override method describirHuesos() {
		const huesos  = []
 	
	 	huesos.add(new Hueso(positionX = 15, positionY = 0))
	 	huesos.add(new Hueso(positionX = 0, positionY = 14))
	 	huesos.add(new Hueso(positionX = 0, positionY = 8))
	 	
	 	return huesos
	}
	
	override method describirMonstruos() {
	 	const monstruos  = []
 	
	 	monstruos.add(new Monstruo(image="monstruo1.png", positionX = 8, positionY = 9))
	    monstruos.add(new Monstruo(image="monstruo2.png", positionX = 8, positionY = 1))
	    monstruos.add(new Monstruo(image="monstruo3.png", positionX = 7, positionY = 12))	
	 	
	 	return monstruos
	 }
	 
	 override method describirTrampas() {
	 	const trampas = []
		
		trampas.add(new Trampa(positionX = 15, positionY = 3))
		trampas.add(new Trampa(positionX = 1, positionY = 10))
		trampas.add(new Trampa(positionX = 4, positionY = 15))
		
		trampas.forEach{t => game.onTick(3000,"sacarTrampa",{ t.cambiar() })}
		
		return trampas
	 }
	 
	 override method describirMuro() {
	 	return repositorioDeMuros.nivel2()
	 }
}


object nivel3 inherits NivelLaberinto {
	
	override method image() {
	 	return "nivel3.png"
	 }
	 
	 override method describirHuesos() {
	 	const huesos  = []
 	
	 	huesos.add(new Hueso(positionX = 8, positionY = 2))
	 	huesos.add(new Hueso(positionX = 15, positionY = 0))
	 	huesos.add(new Hueso(positionX = 12, positionY = 7))
	 	huesos.add(new Hueso(positionX = 5, positionY = 9))

	 	return huesos
	 }
	 
	 override method describirMonstruos() {
	 	const monstruos  = []
 	
	 	monstruos.add(new Monstruo(image="monstruo1.png", positionX = 10, positionY = 10))
	    monstruos.add(new Monstruo(image="monstruo2.png", positionX = 0, positionY = 12))
	    monstruos.add(new Monstruo(image="monstruo3.png", positionX = 15, positionY = 14))
	    monstruos.add(new Monstruo(image="monstruo4.png", positionX = 6, positionY = 8))		
	  
	 	return monstruos
	 }
	 
	 override method describirTrampas() {
	 	const trampas = []
		
		trampas.add(new Trampa(positionX = 11, positionY = 6))
		trampas.add(new Trampa(positionX = 9, positionY = 13))
		trampas.add(new Trampa(positionX = 4, positionY = 2))
		
		trampas.forEach{t => game.onTick(3000,"sacarTrampa",{ t.cambiar() })}
		
		return trampas
	 }
	 
	 override method describirMuro() {
	 	return repositorioDeMuros.nivel3()
	 }
}


object finDelJuego inherits Nivel {
	var imagen = "fin.jpg"
	
	override method image() {
		return imagen
	}
	 
	 method modificarPortada() {
		imagen = "gameOver.jpg"
	}
	 
	 override method song() {
	 	return "sonidos/gameover.mp3"
	 }

	override method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo{ 
			manejadorDeNivel.reiniciarJuego()
		}
	}
	
}


object nivelInicial inherits Nivel {
	
	 override method image() {
	 	return "PortadaOriginal.jpg"
	 }
	 
	 override method song() {
	 	return "sonidos/portada.mp3"
	 }

	override method setInputs(manejadorDeNivel) {
		keyboard.enter().onPressDo { 
			console.println("Enter")
			manejadorDeNivel.avanzarNivel()
		}
	}
	
	method modificarPortada() {}
}