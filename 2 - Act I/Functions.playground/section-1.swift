import Foundation

func sum(number1: Int, number2: Int) -> Int {
  return number1 + number2
}

// we can assign functions to constants/variables (first class)
let operation:(Int, Int) -> Int = sum;
operation(10, 20)

let mySum = sum(10, 10)

// if we don't specify a return type Swift automatically does -> Void
func logSomething() {
  println("something")
}