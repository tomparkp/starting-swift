// Playground - noun: a place where people can play

import UIKit

let crewMembers = 4     // Type Int
let lightyearsAway = 1.234  // Type Double

// Tip: Underscores can be used as thousands separator
let aMillionCredits = 1000000
let aCoolMillionCredits = 1_000_000

// Arithmetic
10 + 10 // Addition
10 - 10 // Subtraction
10 * 10 // Multiplication
10 / 10 // Division
10 % 10 // Remainder

// Numeric conversions must be explicit

let integer = 10
let double = 1.234

//let result = integer * double // Error: needs a type
let doubleResult = Double(integer) * double
let integerResult = integer * Int(double)

// Compound Operations
var compound = 10
compound += 10  // compound = compound + 10
compound -= 10
compound *= 10
compound /= 10
compound %= 10

// Unary Operations
var unary = 10

// Prefix
++unary
--unary

// Postfix
unary++
unary--
