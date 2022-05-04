object heladera {
	method precio() { return 20000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cama {
	method precio() { return 8000 }
	method esComida() { return false }
	method esElectrodomestico() { return false }	
}

object tiraDeAsado {
	method precio() { return 350 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object paqueteDeFideos {
	method precio() { return 50 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object plancha {
	method precio() { return 1200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object milanesa {
	var precio = 260
	
	method precio(valor) {precio = valor}
	method precio() { return precio }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object pureTomate {
	var precio = 90
	method precio(valor) {precio = valor}
	method precio() { return precio }
	method esComida() { return true }
	method esElectrodomestico() { return false }
}

object microondas {
	method precio() { return 4200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object kgCebolla {
	method precio() { return 25 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object compu {
	method precio() { return 500 * dolar.cotizacion() }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object dolar {
	var valorDolar = 200
	method cotizacion(valor) { valorDolar = valor }
	method cotizacion() { return valorDolar }	
}

object packComida{
	var plato
	var aderezo
	const listaPlato = []
	const listaAderezo = []
	
	method platosValidos(lista){
		listaPlato.addAll(lista)
	}
	
	method aderezosValidos(lista){
		listaAderezo.addAll(lista)
	}
	
	method configurarPackComida(unPlato,unAderezo){
		if(! listaPlato.count(unPlato)) self.error("No es un plato valido")
		if(! listaAderezo.count(unPlato)) self.error("No es un plato valido")
		plato = unPlato
		aderezo = unAderezo
	}
	method precio() { return plato.precio() + aderezo.precio() }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object packRegalo{
	const componente = []
	method componentes(){ return componente }
	method agregarComponente(cosa) {componente.add(cosa)}
	method quitarComponente(cosa) {componente.remove(cosa)}
	method precio() { return componente.sum()*0.8 }
	method esComida() { return componente.all({c => c.esComida()}) }
	method esElectrodomestico() { return componente.any( { c => c.esElectrodomestico() } ) }	
}
