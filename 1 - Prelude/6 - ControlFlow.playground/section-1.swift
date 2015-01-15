// Playground - noun: a place where people can play

import UIKit

// Loops
for i in 1...3 {
    println("O'doyle Rules")
}

var range = Range(start: 1, end: 4)

var i = 0
while i < 5 {
    println("O'doyle Rules")
    i++
}

let oceans = ["George Clooney", "Brad Pitt", "Matt Damon"]

for actor in oceans {
    println(actor)
    i++
}

// If/else
let enemyType = "Aliens"

if enemyType == "Wraith" {
    println("Use Fire")
} else if enemyType == "Werewolf" {
    println("Use Silver")
} else {
    println("Nuke it from orbit")
}

// Comparison Operators
// ==  equal
// !=  not equal
// >   greater than
// <   less than
// >=  greater or equal
// <=  less or equal

// Logical Operators
// !    Not (invert)
// &&   And
// ||   Or

// Switches
let hero = "Thor"

switch hero {
case "Thor":
    println("Asguard")
case "Iron Man", "Captain America":
    println("New York, NY")
case "Hawkeye":
    println("Waverly, Iowa")
default:
    println("Unknown")
}