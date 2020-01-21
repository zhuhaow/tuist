//
//  Atomic.swift
//  TuistSupport
//
//  Created by Atkinson, Oliver (Developer) on 21/01/2020.
//

import Foundation

@propertyWrapper
public struct Atomic<Value> {
    
    private var value: Value
    private let lock = NSLock()
    
    public init(wrappedValue value: Value) {
        self.value = value
    }
    
    public var wrappedValue: Value {
        get {
            lock.lock()
            defer { lock.unlock() }
            return value
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            value = newValue
        }
    }
    
}
