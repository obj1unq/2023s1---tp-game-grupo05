import wollok.game.*
import extras.*
import manejadorDeNivel.*

object toby {
	var property position = game.at(0,0)
	var property  orientacion = derecha
	var property cantidadDeHuesos = 0
	var property cantidadDeMonstruos = 0
 
	method image() {
		return orientacion.imagenDeToby()
	}
	
	method moveme(direccion, cantidad) {
		direccion.mover(self, cantidad)
	}	
	
	method ladrar() {
		game.say(self, "Wooof!!!")
	}
	
	 method comer() {
	 	game.say(self, "¡Ya puedo matar al monstruo!")
		cantidadDeHuesos = cantidadDeHuesos + 1
	}
	
	method eliminarMonstruos() {
		cantidadDeMonstruos = cantidadDeMonstruos + 1
		cantidadDeHuesos = cantidadDeHuesos - 1
		if (cantidadDeMonstruos == 3) {
			self.ganar()
			cantidadDeMonstruos = 0
		}
	}
	
	method ganar() {
		game.say(self, "¡Mate todos los monstruos!")
		game.schedule(1000, {manejadorDeNivel.avanzarNivel()})
	}
	
	method perder() {
		manejadorDeNivel.finalizarJuego()
	}
}


class Direccion {
	
	method mover(objeto, cantidad) {
		objeto.orientacion(self)
		if (self.puedeMover(objeto, cantidad)) {
			screen.mover(objeto, self.proxima(objeto, cantidad))
		}
	}
	
	method puedeMover(objeto, cantidad) {
		return screen.puedeIr(self.proxima(objeto, cantidad))
	}
	
	method proxima(objeto, cantidad) 
	
	method imagenDeToby()
}
	
	
object arriba inherits Direccion {
	
	override method proxima(objeto, cantidad) {
		return objeto.position().up(cantidad)
	}
	
	override method imagenDeToby() {
		return "toby-a.png"  
	}
}


object abajo inherits Direccion {
	
	override method proxima(objeto, cantidad) {
		return objeto.position().down(cantidad)
	}
	
	override method imagenDeToby() {
		return "toby-ab.png" 
	}
}


object derecha inherits Direccion {
	
	override method proxima(objeto, cantidad) {
		return objeto.position().right(cantidad)
	}
	
	override method imagenDeToby() {
		return "toby-d.png" 
	}
}


object izquierda inherits Direccion {
	
	override method proxima(objeto, cantidad) {
		return objeto.position().left(cantidad)
	}
	
	override method imagenDeToby() {
		return "toby-iz.png" 
	}
}