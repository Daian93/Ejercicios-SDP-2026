//: [Previous](@previous)

import Foundation

/*: Diseña un mini intérprete que reciba una expresión aritmética en forma de string (por ejemplo, “3+5*2-4/2”) y la evalúe utilizando técnicas de análisis recursivo (recursive descent parsing), explicando la estrategia de separación de tokens y análisis sintáctico. Un token sería cada carácter de la cadena, procesado y traducido a una expresión o valor según el caso. */

class Parser {
    private var tokens: [String]
    private var position = 0
    
    init(input: String) {
        self.tokens = Parser.tokenize(input)
    }
    
    // Tokenizer
    private static func tokenize(_ input: String) -> [String] {
        var tokens: [String] = []
        var number = ""
        
        for char in input {
            if char.isNumber {
                number.append(char)
            } else {
                if !number.isEmpty {
                    tokens.append(number)
                    number = ""
                }
                if "+-*/".contains(char) {
                    tokens.append(String(char))
                }
            }
        }
        
        if !number.isEmpty {
            tokens.append(number)
        }
        
        return tokens
    }
    
    // Recursive Descent Parsing
    func parseExpression() -> Double {
        var value = parseTerm()
        
        while position < tokens.count {
            let op = tokens[position]
            
            if op == "+" || op == "-" {
                position += 1
                let nextValue = parseTerm()
                
                if op == "+" {
                    value += nextValue
                } else {
                    value -= nextValue
                }
            } else {
                break
            }
        }
        
        return value
    }
    
    // Parse 
    private func parseTerm() -> Double {
        var value = parseFactor()
        
        while position < tokens.count {
            let op = tokens[position]
            
            if op == "*" || op == "/" {
                position += 1
                let nextValue = parseFactor()
                
                if op == "*" {
                    value *= nextValue
                } else {
                    value /= nextValue
                }
            } else {
                break
            }
        }
        
        return value
    }
    
    private func parseFactor() -> Double {
        let token = tokens[position]
        position += 1
        return Double(token)!
    }
}

let expression = "3+5*2-4/2"
let parser = Parser(input: expression)
let result = parser.parseExpression()

print("Expression: \(expression)")
print("Result: \(result)")

//: [Next](@next)
