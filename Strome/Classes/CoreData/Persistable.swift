//
//  Persistable.swift
//  Pods-Strome_Example
//
//  Created by Ravi Maurya on 04/04/24.
//

import Foundation
import CoreData

/**
 A protocol representing an object that can be stored using Core Data and encoded/decoded to/from other formats.
 
 Types conforming to `Persistable` must support encoding and decoding through the `Codable` protocol, enabling serialization and deserialization to various data formats. Additionally, they are expected to be suitable for storage in Core Data entities.
 */
public protocol Persistable: Codable {}


extension Array: Persistable where Element: Persistable {}
extension Array: PersistableEntityField where Element: Persistable {}
extension Array: PersistentFetchable where Element: Persistable {}
extension Array: PersistableEntity where Element: Persistable {}


extension Optional: PersistentFetchable where Wrapped: Persistable {}
extension Optional: PersistableEntity where Wrapped: Persistable {}




