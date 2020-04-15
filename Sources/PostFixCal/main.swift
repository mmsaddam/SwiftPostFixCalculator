
var calculator = PostFixCalculator()
let expression1 = "2 3 4 + -"

print("Enter Posfix expression, as like:")
print("3 4 +")
print("3 4 5 + -")
print("Press q to quit calculator")

while let expression = readLine() {
    if expression == "q" {
        break
    } else {
        do {
            if let result = try calculator.evaluate(expression) {
                print("=", result)
            } else {
                print("Calcuation Failed")
            }
            
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}

