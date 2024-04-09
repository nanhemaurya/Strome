//
//  FileServices.swift
//  Pods-Strome_Example
//
//  Created by Ravi Maurya on 07/04/24.
//

import Foundation


public protocol FileServices {
    var fileManager: FileManager { get }
}


extension FileServices {
    public var fileManager: FileManager { FileManager.default }
}
