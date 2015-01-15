
// Declaring Variables
var myVariable = "I can change" // -> No more semicolons (unless you want multiple statements on one line)

// Declaring Constants
let myConstant = "I'm constant"
// myConstant = "Try me" // -> Error: cannot reassign a constant

// Notice we aren't declaring a type -> Type Inference
// Try option + clicking a variable or constant to see its type

// Specifying a Type
let myString: String = "a string" // -> No Longer need @ prefix for strings
let myInteger: Int = 100
let myDouble: Double = 1.234
let myBool: Bool = true
let myArray: Array = ["string 1", "string 2"] // -> Infers contained types
let myIntArray: [Int] = [1, 2]
let myDictionary: Dictionary = ["key":"value"] // -> Infers contained types
let myIntDictionary: [Int:Int] = [1:2, 3:4]

// Variables and Constants in Swift cannot be nil
// var nilVariable = nil // -> Error: cannot be nil
// let nilConstant = nil

// String Interpolation
let stringWithVariable = "Look at me, \(myVariable)"

// Concatenate Strings
let twoStrings = "String 1 and " + "String 2"

// Logging
print(stringWithVariable)
println(twoStrings) // -> Adds a newline, more commonly used

// In Swift we access methods and properties with dot syntax
twoStrings.isEmpty
