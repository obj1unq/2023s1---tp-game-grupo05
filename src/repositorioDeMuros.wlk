import Muro.*

object repositorioDeMuros {
	
	method nivel1()
 	{
 		var muros = []
 		muros.add(new Muro(positionX = 0, positionY = 1))
		muros.add(new Muro(positionX = 0, positionY = 5))
		muros.add(new Muro(positionX = 0, positionY = 7))
		// continuar configurando muros del nivel 1
		return muros
 	
 	}	
}
