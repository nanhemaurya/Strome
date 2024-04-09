//
//  PersistableEntity.swift
//  Strome
//
//  Created by Ravi Maurya on 05/04/24.
//

import Foundation


public typealias FetchablePersistentData =  Persistable & PersistentFetchable

public protocol PersistentFetchable {
    static func fetch(where: [String])
}

extension PersistentFetchable {
    public static func fetch(where: [String] = []) {
        
    }
}


/**
 A protocol representing an object that can be stored using Core Data and encoded/decoded to/from other formats.
 
 Types conforming to `PersistableEntity` must support encoding and decoding through the `Persistable` protocol, enabling serialization and deserialization to various data formats. Additionally, they must provide an initializer that can initialize an instance from a dictionary, facilitating conversion from external representations such as JSON.
 

 ## Examples
 ```swift
// Represents the User entity.
struct User: PersistableEntity {
    @EntityRelationship var name: Name
    @EntityField var age: Int
    @EntityField var phoneNumbers: [String]
    @EntityRelationship var addresses: [Address]
    
    var fullName: String { self.name.fullName }
}
 
 // Represents the name entity.
 struct Name: PersistableEntity {
     @EntityField var firstName: String
     @EntityField var middleName: String?
     @EntityField var lastName: String?
 
 // The full name combining first, middle, and last name.
     var fullName: String {
         var fullName = ""
         fullName.append(self.firstName)
         if let middleName = self.middleName { fullName.append((" " + middleName)) }
         if let lastName = self.lastName { fullName.append((" " + lastName)) }
         return fullName
     }
 }
 
 // Represents the address entity.
 struct Address: PersistableEntity {
     @EntityField var houseNumber: String
     @EntityField var city: String
     @EntityField var state: String
     @EntityField var pinCode: String
 }
```
 ## Example of setting data
 ```swift
 let user = User(
     name: .init(
         firstName: "Ravi",
         middleName: "Prakash",
         lastName: "Maurya"
     ),
     age: 45,
     phoneNumbers: ["99xx2xxx4x", "89xx4xxx9x"],
     addresses: [
         .init(
             houseNumber: "B-2803",
             city: "Delhi",
             state: "Delhi",
             pinCode: "110011"
         ),
         .init(
             houseNumber: "3-1102",
             city: "Navi Mumbai",
             state: "Maharastra",
             pinCode: "401508"
         )
     ]
 )
 ```
*/


public protocol PersistableEntity: FetchablePersistentData {
    
    /**
     Initializes an instance of the conforming type using a dictionary representation.
     
     - Parameter dictionary: A dictionary containing the properties and values to initialize the instance with.
     */
    init?(dictionary: [String: Persistable])
    
    
    var migrationVersion: Int { get }
    
}


extension PersistableEntity {
    
    public var migrationVersion: Int { 1 }
    
    /**
     A dictionary representation of the instance.
     
     The dictionary representation includes all properties of the conforming type, except those marked as `PersistableColumn`. If a property is marked as `PersistableColumn`, only its value will be included in the dictionary representation.
     */
    var toDictionary: [String: Persistable] {
        var dictionary: [String: Persistable] = [:]
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            if let column = value as? PersistableEntityField {
                dictionary[label] = column.value
            } else {
                dictionary[label] = value as? any Persistable
            }
        }
        return dictionary
    }
    
    /**
     Initializes an instance of the conforming type using a dictionary representation.
     
     The dictionary is decoded into an instance of the conforming type using JSON decoding.
     
     - Parameter dictionary: A dictionary containing the properties and values to initialize the instance with.
     
     - Returns: An initialized instance of the conforming type, or `nil` if initialization fails.
     */
    public init?(dictionary: [String: Persistable]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [.prettyPrinted])
            let decoder = JSONDecoder()
            let instance = try decoder.decode(Self.self, from: data)
            self = instance
        } catch {
            print("Error decoding dictionary:", error)
            return nil
        }
    }
    
}


public protocol PersistableFetchEntity: FetchablePersistentData {
    associatedtype Entity: PersistableEntity
    
    init?(dictionary: [String: Persistable])
}


extension PersistableFetchEntity {
    public init?(dictionary: [String : Persistable]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [.prettyPrinted])
            let decoder = JSONDecoder()
            let instance = try decoder.decode(Self.self, from: data)
            self = instance
        } catch {
            print("Error decoding dictionary:", error)
            return nil
        }
    }
    
    public static func fetch(where: [String] = []) {
        
    }
    
}
