object standard{

    method consumo(computadora) = computadora.consumoBase()
    method computo(computadora) = computadora.poderDeComputoBase()
    method computar(computadora) = true
}

class Overclock{
    var usos

    method consumo(computadora) = computadora.consumoBase() * 2 
    method computo(computadora) = computadora.poderDeComputoBase() * computadora.factorOverclock()
    method computar(computadora){
        if(usos == 0){
            computadora.estaQuemado(true)
            throw new DomainException(message="La computadora se quemo")
        }
        usos -= 1
    }
}  

class AhorroDeEnergia{
    var contador = 0
    method consumo(computadora) = 200
    method computo(computadora) = self.consumo(computadora) * computadora.poderDeComputoBase() / computadora.consumoBase()
    method frecuenciaDeError() = 17
    method computar(computadora){
        contador += 1
        if(contador % self.frecuenciaDeError() == 0)
            throw new DomainException(message="El modo ahorro de energia fallo")

    }
}

class APruebaDeFallos inherits AhorroDeEnergia{
    override method computo(computadora) = super(computadora)/2
    override method frecuenciaDeError() = 100
}