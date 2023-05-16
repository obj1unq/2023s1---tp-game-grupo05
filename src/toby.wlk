import wollok.game.*
import extras.*
import manejadorDeNivel.*

object toby {
	var property position = game.at(0,0)
	var property  orientacion = derecha
	var property cantidadDeHuesos = 0

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
		cantidadDeHuesos = cantidadDeHuesos - 1
	}
	
	method perder() {
		manejadorDeNivel.finalizarJuego()
	}
}

	
object arriba {

	method mover(objeto, cantidad) {
		objeto.orientacion(self)
		if (self.puedeMover(objeto, cantidad)) {
			screen.mover(objeto, self.proxima(objeto, cantidad))
		}
	}
	
	method puedeMover(objeto, cantidad) {
		return screen.puedeIr(self.proxima(objeto, cantidad))
	}
	
	method proxima(objeto, cantidad) {
		return objeto.position().up(cantidad)
	}
	
	method imagenDeToby() {
		return "toby-a.png"  
	}
}


object abajo {
	
	method mover(objeto, cantidad) {
		objeto.orientacion(self)
		if (self.puedeMover(objeto, cantidad)) {
			screen.mover(objeto, self.proxima(objeto, cantidad))
		}
	}
	
	method puedeMover(objeto, cantidad) {
		return screen.puedeIr(self.proxima(objeto, cantidad))
	}
	
	method proxima(objeto, cantidad) {
		return objeto.position().down(cantidad)
	}
	
	method imagenDeToby() {
		return "toby-ab.png" 
	}
}

object derecha {
	
	method mover(objeto, cantidad) {
		objeto.orientacion(self)
		if (self.puedeMover(objeto, cantidad)) {
			screen.mover(objeto, self.proxima(objeto, cantidad))
		}
	}
	
	method puedeMover(objeto, cantidad) {
		return screen.puedeIr(self.proxima(objeto, cantidad))
	}
	
	method proxima(objeto, cantidad) {
		return objeto.position().right(cantidad)
	}
	
	method imagenDeToby() {
		return "toby-d.png" 
	}
}

object izquierda {
	
	method mover(objeto, cantidad) {
		objeto.orientacion(self)
		if (self.puedeMover(objeto, cantidad)) {
			screen.mover(objeto, self.proxima(objeto, cantidad))
		}
	}
	
	method puedeMover(objeto, cantidad) {
		return screen.puedeIr(self.proxima(objeto, cantidad))
	}
	
	method proxima(objeto, cantidad) {
		return objeto.position().left(cantidad)
	}
	
	method imagenDeToby() {
		return "toby-iz.png" 
	}
}