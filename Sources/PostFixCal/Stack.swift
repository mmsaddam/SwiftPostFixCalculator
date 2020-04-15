//
//  Stack.swift
//  Algorithm
//
//  Created by Muzahidul Islam on 14/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation


public struct Stack<T> {
    enum Container {
        case array, linkList
    }
    
    public enum StackError: String, Error {
        case empty = "Stack is Empty"
    }
    
    private var list = LinkList<T>()
    
    public var count: Int {
        return list.count
    }
    
    public mutating func push(_ item: T) {
        list.addFirst(item)
    }
    
    public mutating func pop() throws -> T? {
        if list.count == 0 {
            throw StackError.empty
        }
        return list.removeFirst()
    }
    
    public func peek() throws -> T? {
        if list.count == 0 {
            throw StackError.empty
        }
        return list.head?.value
    }
    
    public mutating func clear() {
        list.clear()
    }
    
    public func enumarated(_ closure: (T) -> Void) {
        list.enumarated(closure)
    }
    
}
