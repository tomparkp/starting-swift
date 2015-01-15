// Playground - noun: a place where people can play

import UIKit

// Can't set variables and constants to nil
// var string: String = nil // Error

// Optional
var string: String? = nil // Okay

var stringOptional: String? = "Optional" // Value wrapped in optional {Some:"Optional"}

stringOptional = "Changed!"

stringOptional.uppercaseString // Error

// "Safe" way
if let unwrappedString = stringOptional {
    unwrappedString.uppercaseString
}

// "Unsafe" Ways
stringOptional!.uppercaseString //Forced unwrap
var unwrappedstring: String! //Implicit unwrap


// Optional Chaining
var anotherString: String? = "Big gulps huh?"

let newString = anotherString?.anotherOptional?.uppercaseString
