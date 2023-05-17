import wollok.game.*

object screen {
	
	method mover(objeto, position) {
		if(self.puedeIr(position)){
			objeto.position(position)
		}		
	}
	
	method dentro(position) {
		return position.x().between(0, game.width()-1) and
				position.y().between(0, game.height()-1)
	}
	
	method puedeIr(position) {
		return self.dentro(position) and not self.hayMuro(position)
	}
	
	method hayMuro(position) {
		return game.getObjectsIn(position).any({x => not x.atravesable()})
	}
}