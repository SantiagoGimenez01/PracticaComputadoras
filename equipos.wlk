class Equipo{
    var property estaQuemado = false
    var property modo

    method consumoBase()
    method computoBase()
    method factorOverclock()
    method consumo() = modo.consumo(self)
    method computo() = modo.computo(self)
    method estaActivo() = !self.estaQuemado() && self.computo() > 0
    method computar(problema){
        if(problema.complejidad() > self.computo())
            throw new DomainException(message="La complejidad del problema es mayor que el nivel de computo")
        modo.computar(self)
    }
}

class A105 inherits Equipo{

    override method consumoBase() = 300
    override method computoBase() = 600
    override method factorOverclock() = 1.3
    override method computar(problema){
        if(problema.complejidad() < 5)
            throw new DomainException(message="La complejidad del problema es menor a 5")
        super(problema)
        modo.computar(self)
    }
}

class B2 inherits Equipo{
    const chips

    override method consumoBase() = chips * 50 + 10
    override method computoBase() = (chips * 100).min(800)
    override method factorOverclock() = 20 * chips
}