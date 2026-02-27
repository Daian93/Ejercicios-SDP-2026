//: [Previous](@previous)

import Foundation

/*: Investiga los tipos de datos primitivos en Swift (por ejemplo, Int, Double, String, Bool, Character) y crea dos ejemplos (una variable y una constante) para cada uno. Explica en comentarios cuándo conviene usar cada uno.

 Los tipos de datos primitivos en Swift son los siguientes:

 ## 1. INTEGER

 Usamos la palabra clave Int para crearlos. Este tipo de dato se utiliza para representar un número entero sin componente fraccionario. El tipo entero permite definir variantes para que se pueda definir su rango y si debe contener número con signo negativo o solo positivo:

 * Int8: entero de 8bits, su rango es de -128 a 127.
 * UInt8: entero sin signo de 8 bits, su rango es de 0 a 256.
 * Int16: entero de 16bits, su rango es de -32768 a 32767
 * UInt16: entero sin signo de 16 bits, su rango es de 0 a 65535.
 * Int32: entero de 32bits, su rango es de -2147483648 a 2147483647.
 * UInt32: entero sin signo de 32 bits, su rango es de 0 4294967295.
 * Int64: entero de 64bits, su rango es de -9223372036854775808 9223372036854775807.
 * UInt64: entero sin signo de 64 bits, su rango es de 0 a 18446744073709551615.

 ## 2. DOUBLE

 Usamos la palabra clave Double o Float para crearlos. Este tipo de dato se utiliza para representar un número con decimales. La diferencia de usar uno o el otro es la precisión del número de punto flotante que queremos almacenar:

 * Float: coma flotante de 32 bits (6 dígitos decimales).
 * Double: coma flotante de 64 bits (15 dígitos decimales).

 ## 3. BOOLEAN

 Usamos la palabra clave Bool para crearlos. Este tipo de datos se utiliza para representar entidades lógicas. Puede tener uno de los dos valores: verdadero (true) o falso (false).

 ## 4. CHARACTER

 Usamos la palabra clave Character para crearlos. Este tipo de datos se utiliza para representar un solo carácter.

 ## 5. STRING

 Usamos la palabra clave String para crearlos. Este tipo de datos se utiliza para representar datos textuales. Soporta carácteres unicode.

 Hay que tener en cuenta que para crear una variable se debe utilizar la palabra clave 'var' y para crear una constante se debe utilizar 'let'. Las variables se utilizan cuando el valor puede cambiar y las constantes cuando el valor es fijo y no debería modificarse.
 */

// DOS EJEMPLOS DE INTEGER

var age: Int = 32
let weekDays: Int = 7

// DOS EJEMPLOS DE DOUBLE

var temperature: Double = 24.5
let pi: Double = 3.14159

// DOS EJEMPLOS DE BOOL

var isLogged: Bool = false
let isAdult: Bool = true

// DOS EJEMPLOS DE CHARACTER

var letter: Character = "A"
let symbol: Character = "€"

// DOS EJEMPLOS DE STRING

var name: String = "Diana"
let country: String = "Spain"

//: [Next](@next)
