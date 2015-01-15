
class Movie {
    var averageRating = 5.0
}

struct Rating {
    var averageRating = 5.0
}

var aliens = Movie()
var referenceToAliens = aliens
aliens.averageRating = 9.5
aliens.averageRating
referenceToAliens.averageRating
// Values are the same

var aliensRating = Rating()
var referenceToAliensRating = aliensRating
aliensRating.averageRating = 9.5
aliensRating.averageRating
referenceToAliensRating.averageRating
// Values are not the same
// Its not actually referencing the original
// Its copying the values

/*
    Another significant difference between classes and structs is how they handle being a constant.
    
    Classes - a constant can have its properties altered (if they are variables) but the object itself can't be reassigned

    Structs - you can't alter their values or reassign them
*/

var variableMovie = Movie()
let constantMovie = Movie()
constantMovie.averageRating = 10.0 // -> Works
// constantMovie = variableMovie // -> Error: can't assign to constant value

var variableRating = Rating()
let constantRating = Rating()
variableRating.averageRating = 9.0
// constantRating.averageRating = 9.0 // -> Error: can't assign
// constantRating = variableRating // -> Error

// With structs the entire struct is constant
// Swift Arrays and Dictionaries are examples of structs