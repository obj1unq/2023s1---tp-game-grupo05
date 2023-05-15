import wollok.game.*
import extras.*

object toby {
	var property position = game.at(0,0)
	var property  energia= 0
	var property  orientacion = derecha
	
	method image() {
		return orientacion.imagenDeToby()
	}
	
	method moveme(direccion, cantidad) {
		direccion.mover(self, cantidad)
	}	
	
	method ladrar() {
		game.say(self, "Wooof!!!")
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