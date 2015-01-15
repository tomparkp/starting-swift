// Playground - noun: a place where people can play

import UIKit

/*{ (params) -> returnType in
    statements
}*/

let padawans = ["Knox", "Avitla", "Mennaus"]

let closure = {(padawan: String) -> String in
    "\(padawan) has been trained!"
}

padawans.map()

// Known arguments (common use case)
func applyMultiplication(value: Int, multFunction: Int -> Int) -> Int {
    return multFunction(value)
}

applyMultiplication(2, {value in
    value * 3
})

// Using shorthand we reference by position
applyMultiplication(2, {$0 * 3})

// When last parameter we can omit )
applyMultiplication(2) {$0 * 3}
