// Playground - noun: a place where people can play

import UIKit

// Arrays
var characters = ["Luke Skywalker", "Anakin Skywalker"]
characters[1] = "Darth Vader"

// Easy concatenate
let moreCharacters = ["C3PO", "R2D2"]
characters += moreCharacters

// Methods
characters.append("Han Solo")
characters.insert("Princess Leia", atIndex: 0)
characters.removeAtIndex(1)

characters.count
characters.isEmpty
characters.first
characters.last

// Dictionaries
var professions = ["Boba Fett": "Bounty Hunter", "Han Solo": "Smuggler"]

// Access with key
professions["Han Solo"]

// Add with key
professions["Darth Vader"] = "Sith Lord"

// Methods
professions.removeValueForKey("Han Solo")
professions.updateValue("Boba Fett", forKey: "Sarlac Food")

professions.count
professions.isEmpty