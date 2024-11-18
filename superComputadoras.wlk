class SuperComputadora{
    const equiposConectados = []
    var maximaComplejidadProcesada = 0

    method consumo() = self.equiposActivos().sum({equipo => equipo.consumo()})
    method computo() = self.equiposActivos().sum({equipo => equipo.poderDeComputo()})
    method estaActivo() = true
    method equiposActivos() = equiposConectados.filter({equipo => equipo.estaActivo()})
    method equipoQueMasConsume() = self.equiposActivos().max({equipo => equipo.consumo()})
    method equipoQueMasComputa() = self.equiposActivos().max({equipo => equipo.computo()})
    method estaMalConfigurada() = self.equipoQueMasConsume() != self.equipoQueMasComputa()
    method computar(problema){
        self.equiposActivos().foreach({equipo => equipo.computar(new Problema(complejidad = problema.complejidad() / self.equiposActivos().size()))})
        maximaComplejidadProcesada += problema.complejidad()
    }
}

class Problema{
    const property complejidad
}

