//
//  EntityRelationship.swift
//  Strome
//
//  Created by Ravi Maurya on 07/04/24.
//

import Foundation

/**
 The `PersistableDeleteRule` enum defines various delete rules for relationships in a persistable entity, specifying the behavior when the referenced object is deleted.
 
 
 An enumeration representing delete rules for relationships in a persistable entity.
 
 Delete rules define the behavior when the referenced object is deleted.
 
 - noAction: Specifies no action upon deletion of the referenced object.
 - nullify: Specifies to set the relationship to null upon deletion of the referenced object.
 - cascade: Specifies to cascade the deletion to the referenced object.
 - deny: Specifies to deny the deletion if the referenced object is still in use.
 */

public enum PersistableDeleteRule: Persistable {
    /// Specifies no action upon deletion of the referenced object.
    case noAction
    
    /// Specifies to set the relationship to null upon deletion of the referenced object.
    case nullify
    
    /// Specifies to cascade the deletion to the referenced object.
    case cascade
    
    /// Specifies to deny the deletion if the referenced object is still in use.
    case deny
}



/**
 The `PersistableRelationshipType` enum defines different types of relationships in a persistable entity, specifying the nature of the relationship between entities.
 
 An enumeration representing the type of relationship in a persistable entity.
 
 Relationship types define the nature of the relationship between entities.
 - auto: Specifies automatic determination of the relationship type.
 - toOne: Specifies a to-one relationship.
 - toMany: Specifies a to-many relationship with specified minimum and maximum counts.
 */
public enum PersistableRelationshipType: Persistable {
    /// Specifies automatic determination of the relationship type.
    case auto
    
    /// Specifies a to-one relationship.
    case toOne
    
    /// Specifies a to-many relationship with specified minimum and maximum counts.
    case toMany(minimum: Int, maximum: Int)
}

/** 
 The `PersistableRelationship` protocol defines requirements for a relationship property within a persistable entity, including the associated entity type, delete rule, and relationship type.

 A protocol representing a relationship property within a persistable entity.
 
 Types conforming to `PersistableRelationship` must provide access to the wrapped value of type `Entity`, along with specifying delete rules and relationship types.
 
 ### How to create your own Relationship
  To create your own relationship in a persistable entity, you can use the provided `CustomRelation` property wrapper. Follow these steps:
  
  1. Implement the `CustomRelation` property wrapper in your entity struct or class to define the relationship.
  
  ```swift
  @propertyWrapper
  struct CustomRelation<T: PersistableEntity>: PersistableRelationship {
      // The associated entity type.
      typealias Entity = T
  
      // The wrapped value representing the related entity.
      var wrappedValue: T
  
      // The delete rule of the relationship.
      var deleteRule: PersistableDeleteRule = .cascade
  
      // The relationship type.
      var relationshipType: PersistableRelationshipType = .auto
  }
 ```
 2. Customize the CustomRelation property wrapper to fit your requirements. You can specify the delete rule and relationship type.
 
 Now, you can use the @CustomRelation property wrapper to create your own relationships between entities in your persistable entity.
 */
public protocol PersistableRelationship: Persistable {
    /// The associated type representing the entity of the relationship.
    associatedtype Entity: PersistableEntity
    
    /// The wrapped value of the relationship property.
    var wrappedValue: Entity { get set }
    
    /// The delete rule of the relationship.
    var deleteRule: PersistableDeleteRule { get }
    
    /// The relationship type.
    var relationshipType: PersistableRelationshipType { get }
}

/** 
 
 The `EntityRelationship` property wrapper is used to define relationships between entities within a persistable entity.

 A property wrapper for defining relationships within a persistable entity.
 
 The `EntityRelationship` property wrapper is used to define relationships between entities within a persistable entity. It provides access to the wrapped value of type `T`, representing the related entity. Additionally, it allows specifying the delete rule and relationship type for the relationship.
 */
@propertyWrapper
public struct EntityRelationship<T: PersistableEntity>: PersistableRelationship {
    /// The associated entity type.
    public typealias Entity = T
    
    /// The relationship type.
    public var relationshipType: PersistableRelationshipType = .auto
    
    /// The delete rule of the relationship.
    public var deleteRule: PersistableDeleteRule = .noAction
    
    /// The wrapped value representing the related entity.
    public var wrappedValue: T
    
    /**
     Initializes an instance of the `EntityRelationship` property wrapper with the specified wrapped value.
     
     - Parameter wrappedValue: The initial value to wrap.
     */
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

