//
//  PersistableColumn.swift
//  Strome
//
//  Created by Ravi Maurya on 05/04/24.
//

import Foundation
import CoreData


/**
 A protocol representing a column in a persistent store, such as a column in a Core Data entity.
 
 Types conforming to `PersistableColumn` must support encoding and decoding through the `Persistable` protocol, enabling serialization and deserialization to various data formats. Additionally, they must provide properties to specify the attribute type of the column and to retrieve the value of the column.
 */
public protocol PersistableEntityField: Persistable {
    /// The attribute type of the column.
    var attributeType: NSAttributeType { get }
    
    /// The value of the column.
    var value: Persistable { get }
}



extension PersistableEntityField {
    
    /// The default implementation of `attributeType` returns `.undefinedAttributeType`.
    public var attributeType: NSAttributeType { .undefinedAttributeType }
    
    public var value: Persistable { self }
    
}


/**
 A property wrapper that represents a field of a persistable entity.
 
 The `EntityField` property wrapper is used to define properties within a persistable entity. It wraps a value of type `T`, which must conform to the `PersistableEntityField` protocol. This wrapper provides support for encoding and decoding through the `Persistable` protocol, enabling serialization and deserialization of the wrapped value.
 */
@propertyWrapper
public struct EntityField<T: PersistableEntityField>: Persistable {
    /// The wrapped value of type `T`.
    public var wrappedValue: T
    
    /**
     Initializes an instance of the `EntityField` property wrapper with the specified wrapped value.
     
     - Parameter wrappedValue: The initial value to wrap.
     */
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

/// Extension to allow `String` to conform to the `PersistableEntityField` protocol.
extension String: PersistableEntityField {}

/// Extension to allow `Int` to conform to the `PersistableEntityField` protocol.
extension Int: PersistableEntityField {}

/// Extension to allow `Float` to conform to the `PersistableEntityField` protocol.
extension Float: PersistableEntityField {}

/// Extension to allow `Double` to conform to the `PersistableEntityField` protocol.
extension Double: PersistableEntityField {}

/// Extension to allow `Optional` to conform to the `Persistable` protocol if the wrapped type conforms to `Persistable`.
extension Optional: Persistable where Wrapped: Persistable {}

/// Extension to allow `Optional` to conform to the `PersistableEntityField` protocol if the wrapped type conforms to `PersistableEntityField`.
extension Optional: PersistableEntityField where Wrapped: PersistableEntityField {}







