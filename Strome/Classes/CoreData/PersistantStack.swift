//
//  PersistantStack.swift
//  Strome
//
//  Created by Ravi Maurya on 05/04/24.
//

import Foundation

/**
 A protocol defining a persistent stack for managing data storage and retrieval.
 
 Types conforming to `PersistantStack` provide functionality for managing data persistence, such as saving and fetching data from a persistent store.
 */
public protocol PersistantStack {
    static var jsonEncoder: JSONEncoder { get }
}



extension PersistantStack {
    
    /**
     The JSON encoder used by the persistent stack to encode data into JSON format.
     
     This property provides a configured instance of `JSONEncoder` with specific output formatting options set. On iOS 11.0 and later, the encoder includes the `.sortedKeys` option for consistent key ordering in the generated JSON. For earlier iOS versions, the encoder omits this option.
     
     - Returns: A configured instance of `JSONEncoder`.
     */
    static var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 11.0, *) {
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        } else {
            encoder.outputFormatting = [.prettyPrinted]
        }
        return encoder
    }
    
}
