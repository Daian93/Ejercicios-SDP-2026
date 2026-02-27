//: [Previous](@previous)

import Foundation

/*: Define una enumeración para los meses del año y utiliza una estructura switch para clasificar cada mes como inicio, medio o final de estación (según criterios que tú establezcas). Asegúrate de cubrir todos los casos. */

enum Mes {
    case enero, febrero, marzo,
        abril, mayo, junio,
        julio, agosto, septiembre,
        octubre, noviembre, diciembre
}

/*: Los criterios a establecer son los del hemisferio norte:
 * Primavera: marzo, abril, mayo.
 * Verano: junio, julio, agosto.
 * Otoño: septiembre, octubre, noviembre.
 * Invierno: diciembre, enero, febrero.

 Y dentro de cada estación:
 * Primer mes → inicio.
 * Segundo mes → medio.
 * Tercer mes → final.
*/

func clasificarEstacion(mes: Mes) -> String {
    switch mes {
    case .marzo, .junio, .septiembre, .diciembre:
        return "Inicio de estación"
    case .abril, .julio, .octubre, .enero:
        return "Medio de estación"
    case .mayo, .agosto, .noviembre, .febrero:
        return "Final de estación"

    }
}

print(clasificarEstacion(mes: .marzo))
print(clasificarEstacion(mes: .octubre))
print(clasificarEstacion(mes: .febrero))

//: [Next](@next)
