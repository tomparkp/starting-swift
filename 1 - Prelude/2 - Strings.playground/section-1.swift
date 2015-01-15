// Playground - noun: a place where people can play

import UIKit

// We no longer need @
let string1 = "Game Over"
let string2 = " Man"
// We can concatenate strings easily
let combinedString = string1 + string2

var quote = "Game Over ".stringByAppendingString("Man")
quote += ", Game Over!"
println(quote.capitalizedString)

// String Interpolation
let interpolatedString = "\(combinedString), Game Over!"
