// Playground - noun: a place where people can play

import UIKit

let theCake = false

// Only accepts true/false
let theCake = YES   // Error
let theCake = TRUE  // Error

// Only Booleans can be true/false
var myString = "The Cake is a Lie"
myString == true // Error
if myString {
    // Error
}

var myInt = 1
myInt == true // Error
