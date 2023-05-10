import wollok.game.*

object toby {
	var property position = game.at(0,0)
	var property  energia= 0
	var property  orientacion= derecha
	
	method image() {
		return orientacion.imagenDeToby()
	}
	
	method mover(direccion, cantidad){
		direccion.moveme(self, cantidad)
	}
    	
}

object arriba {
	method moveme(objeto, cantidad) {
		objeto.orientacion(self)
		objeto.position(new Position(x = objeto.position().x(), y = objeto.position().y() + cantidad))
	}
	
	method imagenDeToby() {
		return "toby-a.png"  
	}
}

object abajo {
	method moveme(objeto, cantidad) {
		objeto.orientacion(self)
		objeto.position(new Position(x = objeto.position().x(), y = objeto.position().y() - cantidad))
	}
	
	method imagenDeToby() {
		return "toby-ab.png" 
	}
}

object derecha {
	method moveme(objeto, cantidad) {
		objeto.orientacion(self)
		objeto.position(new Position(x = objeto.position().x() + cantidad, y = objeto.position().y()))
	}
	
	method imagenDeToby() {
		return "toby-d.png" 
	}
}

object izquierda {
	method moveme(objeto, cantidad) {
		objeto.orientacion(self)
		objeto.position(new Position(x = objeto.position().x() - cantidad, y = objeto.position().y()))
	}
	
	method imagenDeToby() {
		return "toby-iz.png" 
	}
}