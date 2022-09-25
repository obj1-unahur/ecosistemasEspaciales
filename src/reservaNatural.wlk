import especies.*

object reserva {
	const habitats = []
	
	method agregarHabitat(unHabitat) {habitats.add(unHabitat)}
	method habitatConMayorBiomasa() = habitats.max({h=>h.totalBiomasa()})
	method cantidadTotalBiomasa() = habitats.sum({h=>h.totalBiomasa()})
	method habitatsDesequilibrados() = habitats.filter({h=>!h.estaEnEquilibrio()})
	method especieEstaEnTodosLosHabitats(unaEspecie) = 
		habitats.all({h=>h.contieneEspecie(unaEspecie)})
}

class Habitat {
	const seresVivos = []
	
	method agregarEspecies(listaEspecies) {seresVivos.addAll(listaEspecies)}
	method totalBiomasa() = seresVivos.sum({e=>e.biomasa()})
	method agregarEspecie(unaEspecie) = seresVivos.add(unaEspecie)
	method cantidadEjemplaresGrandes() = seresVivos.count({e=>e.esGrande()})
	method cantidadEjemplaresPequenios() = seresVivos.count({e=>e.esPequenio()})
	method hayMedianos() = seresVivos.any({e=>e.esMediano()})
	method estaEnEquilibrio() = 
		self.cantidadEjemplaresGrandes() < self.cantidadEjemplaresPequenios() / 3 &&
		self.hayMedianos()
	method especiesExistentes() = seresVivos.map({ser=>ser.especie()})
	method contieneEspecie(unaEspecie) = self.especiesExistentes().contains(unaEspecie)
	method producirIncendio() {
		seresVivos.forEach({ser=>ser.consecuenciasPorIncendio()})
		self.quitarSeresNoVivos()
	}
	method seresNoVivos() = seresVivos.filter({ser=>!ser.estaVivo()})
	
	method quitarSeresNoVivos() {seresVivos.removeAll(self.seresNoVivos())} 
}


