import wollok.game.*
import toby.*

object movimientosDeToby {
	
	method registrarMovimientos() {
		keyboard.up().onPressDo({ toby.moveme(arriba, 1)})
		keyboard.down().onPressDo({ toby.moveme(abajo, 1)})
		keyboard.left().onPressDo({ toby.moveme(izquierda, 1)})
		keyboard.right().onPressDo({ toby.moveme(derecha, 1)})
	}
}