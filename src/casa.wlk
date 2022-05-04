import cosas.* 

object casa {
	const cosas = []
	
	method comprar(cosa){cosas.add(cosa)}//: registra que se ha comprado una cosa.
	method cantidadDeCosasCompradas()= cosas.size()//indica ... eso.
	method tieneComida()= cosas.any({c => c.esComida()})//indica si compró algo que es comida al menos una vez.
	method vieneDeEquiparse() = cosas.last().esElectrodomestico()||cosas.last().precio()>5000 //indica si la última cosa que se compró es un electrodoméstico, o bien vale más de 5000 pesos.
	method esDerrochona() = cosas.sum({c=>c.precio()})>=9000 //indica si el importe total de las cosas compradas es de 9000 pesos o más.
	method compraMasCara()= cosas.max({c=>c.precio()})//retorna la cosa comprada de mayor valor.
	method electrodomesticosComprados()= cosas.filter({c => c.esElectrodomestico()})// devuelve un objeto que contiene todas las cosas compradas que son electrodomésticos.
	method malaEpoca()= cosas.all({c => c.esComida()})// indica si todas las cosas compradas son comida.
	method queFaltaComprar(lista)= lista.asSet().difference(cosas.asSet())
	method faltaComida() = cosas.count( { c => c.esComida() } ) < 2
	method gastoEnComida() = self.listaDeComidas().sum( { c => c.precio()})
	method listaDeComidas() = cosas.filter( { c => c.esComida()})
	
	method hayElectrodomesticosBaratos() = 
		self.electrodomesticosComprados().any( { c => c.precio()< 3000}) 
	
	method preciosDeElectrodomesticos() = 
		self.electrodomesticosComprados().map( { c => c.precio()})
	
	method nivelEnAumento() = self.precioUltimaCosa() >= self.precioPrimerCosa()*2
	
	method precioPrimerCosa() = cosas.first().precio()
	
	method precioUltimaCosa() = cosas.last().precio()
	
	method primeraComidaComprada() = self.listaDeComidas().first()// cosas.find( { c => c.esComida()})
}
/*
queFaltaComprar(lista): recibe una lista de cosas y devuelve las cosas de esa lista que aún no se han comprado.
Atención: es una pregunta. No se pide que se compren.

*/