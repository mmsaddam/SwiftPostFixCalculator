//
//  PostFixCalculator.swift
//  Algorithm
//
//  Created by Muzahidul Islam on 14/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

public struct PostFixCalculator {
    
   public enum Exception: String, Error {
        case invalidExpression
        case invalidOperator
    }
    
    private enum OperatorType: String {
        case plus = "+"
        case minus = "-"
        case multiplication = "*"
        case division = "/"
        case remainder = "%"
    }
    
    public init() {  }
    
    private var stack = Stack<Int>()
    
    public mutating func evaluate(_ input: String) throws -> Int? {
        stack.clear()
        
        try input.split(separator: " ").forEach { token in
            if let operand = Int(token) {
                stack.push(operand)
                
            } else {
                guard let lhs = try? stack.pop(), let rhs = try? stack.pop() else { throw Exception.invalidExpression }
                
                guard let _operator = OperatorType(rawValue: String(token)) else { throw Exception.invalidOperator }
                
                switch _operator {
                case .plus: stack.push(lhs + rhs)
                case .minus: stack.push(lhs - rhs)
                case .multiplication: stack.push(lhs * rhs)
                case .division: stack.push(lhs / rhs)
                case .remainder: stack.push(lhs % rhs)
                }
            }
        }
        
        return try stack.pop()
    }
}
