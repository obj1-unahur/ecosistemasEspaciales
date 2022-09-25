class EspecieFauna {
	const property pesoReferencia
	const property formaDeLocomocion
	const property coeficiente
}

class Animal {
	const property especie
	var peso
	var estaVivo = true
	
	method peso() = peso
	method estaVivo() = estaVivo
	method biomasa() = peso**2 / especie.coeficiente()
	method esGrande() = peso > especie.pesoReferencia() * 2
	method esPequenio() = peso < especie.pesoReferencia() / 2
	method esMediano() = !self.esGrande() && !self.esPequenio()
	method consecuenciasPorIncendio() {
		peso *= 0.9
		if(!especie.formaDeLocomocion().seSalva(self)) estaVivo = false
	}	
						
}

class EspecieFlora {
	const property alturaMaxDeReferencia
}

class Planta {
	var estaVivo = true
	const property especie
	var property altura
	
	method estaVivo() = estaVivo	
	method biomasa() = especie.alturaMaxDeReferencia().min(altura * 2)
	method esGrande() = altura > 10
	method esPequenio() = !self.esGrande()
	method esMediano() = false	
	method consecuenciasPorIncendio() {
		if(self.esPequenio()) estaVivo = false
		else altura = 0.max(altura - 5)
	}
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr {method seSalva(animal) = animal.esMediano()}
object quedarseQuieto {method seSalva(_) = false}