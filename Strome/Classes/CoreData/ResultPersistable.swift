//
//  ResultPersistable.swift
//  Strome
//
//  Created by Ravi Maurya on 04/04/24.
//

import Foundation
import CoreData

/// A generic struct representing a result that can be persisted, with associated type `Entity` conforming to `PersistableEntity`.
public struct ResultPersistable<Entity: PersistableEntity> {
    /// The entity associated with the result.
    public var entity: Entity!
    
    /// The managed object representing the result in Core Data.
    var manageObject: NSManagedObject
    
    /// Initializes a `ResultPersistable` instance with the given managed object.
    /// - Parameter manageObject: The managed object representing the result in Core Data.
    init(manageObject: NSManagedObject) {
        self.manageObject = manageObject
        // Initialize the entity from the dictionary representation of the managed object.
        self.entity = Entity(dictionary: self.manageObject.toDictionary)
    }
}

/**
 An extension of `NSManagedObject` providing utility methods for conversion and description.
 */
extension NSManagedObject {
    
    /**
     A string representation of the attributes and their values for the managed object.
     
     - Returns: A string describing the attributes and their values.
     */
    var printDescription: String {
        let keys = Array(self.entity.attributesByName.keys)
        var dict: [String: Any] = [:]
        dict = keys.reduce(into: [String: Any](), {
            $0[String($1.dropFirst())] = self.value(forKey: $1) ?? (NSNull() as Any)
        })
        return dict.description
    }
    
    /**
     Converts the managed object to a dictionary representation.
     
     - Returns: A dictionary containing the attributes of the managed object.
     */
    var toDictionary: [String: Persistable] {
        let keys = Array(self.entity.attributesByName.keys)
        return self.toDictionary(keys: keys)
    }
    
    /**
     Converts the managed object to a dictionary representation with specified keys.
     
     - Parameter keys: The keys for the attributes to include in the dictionary.
     - Returns: A dictionary containing the specified attributes of the managed object.
     */
    func toDictionary(keys: [String]) -> [String: Persistable] {
        var dict: [String: Persistable] = [:]
        let keys = Array(self.entity.attributesByName.keys)
        dict = keys.reduce(into: [String: Persistable](), {
            $0[String($1.dropFirst())] = self.value(forKey: $1) as? any Persistable
        })
        return dict
    }
    
    /**
     Sets attribute values of the managed object using a `PersistableEntity`.
     
     - Parameter persistableEntity: The `PersistableEntity` containing attribute values to set.
     */
    func addValues<T: PersistableEntity>(using persistableEntity: T) {
        persistableEntity.toDictionary.forEach { (key, value) in
            self.setValue(value, forKey: key)
        }
    }
    
}
