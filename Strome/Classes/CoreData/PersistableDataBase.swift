//
//  PersistableDataBase.swift
//  Strome
//
//  Created by Ravi Maurya on 05/04/24.
//

import Foundation

/**
 A protocol representing a persistable database entity.
 
 Types conforming to `PersistableDataBase` must also conform to the `Persistable` protocol, enabling serialization and deserialization to various data formats.
 */
public protocol PersistableDataBase: Persistable {}
