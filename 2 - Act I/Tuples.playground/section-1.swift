// Playground - noun: a place where people can play

import UIKit

let home = (221, "Baker Street")
println(home.0)
println(home.1)

let (number, street) = home
println(number)

let address = (number: 221, street: "Baker Street")
println(address.street)

let three: (Int, Int, Int) = (1,2,3)
