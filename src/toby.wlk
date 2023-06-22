import wollok.game.*
import manejadorDeNivel.*
import soundProducer.*

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
	
	 method comer(comida) {
	 	cantidadDeHuesos = cantidadDeHuesos + 1
	 	comida.desaparecer()
	}
	
	method matarOMorir(amenaza) {
		if (self.cantidadDeHuesos() >= 1) {
			self.eliminarMonstruo()
			amenaza.desaparecer()
		} else {
			game.say(amenaza, "¡Necesitas un hueso para matarme!")
		 	self.perder()
		}
	}
	
	method eliminarMonstruo() {
		cantidadDeMonstruos = cantidadDeMonstruos + 1
		cantidadDeHuesos = cantidadDeHuesos - 1
		if (cantidadDeMonstruos == 3) {
			self.ganar()
			cantidadDeMonstruos = 0
		}
	}

	method ganar() {
		manejadorDeNivel.avanzarNivel()
	}
	
	method perder() {
		soundProducer.sound("sonidos/muerte.mp3").play()
		manejadorDeNivel.finalizarJuego()
	}
}


class Direccion {
	
	method mover(objeto, cantidad) {
		soundProducer.sound("sonidos/tobycaminando.mp3").play()
		objeto.orientacion(self)
		if (self.puedeMover(objeto, cantidad)) {
			objeto.position(self.proxima(objeto, cantidad))
		}
	}
	
	method puedeMover(objeto, cantidad) {
		return self.puedeIr(self.proxima(objeto, cantidad))
	}
	
	method puedeIr(position) {
		return self.dentro(position) and not self.hayMuro(position)
	}
	
	method dentro(position) {
		return position.x().between(0, game.width()-1) and
				position.y().between(0, game.height()-1)
	}
	
	method hayMuro(position) {
		return game.getObjectsIn(position).any({x => not x.atravesable()})
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