//
//  StromeManager.swift
//  Strome
//
//  Created by Ravi Maurya on 04/04/24.
//

import Foundation

/// `StromeManager` is a singleton class responsible for managing the configuration of the Strome framework.
///
/// The `StromeManager` class provides functionality to configure the Strome framework, particularly with regards to resource loading from a specified bundle. It is designed as a singleton to ensure a single, globally accessible instance throughout the application lifecycle.
///
/// Usage Example:
///
/// ```swift
/// // Use the default bundle
/// let stromeManager = StromeManager.shared
///
/// // Alternatively, initialize with a custom bundle
/// let customBundle = Bundle(identifier: "com.example.CustomBundle")
/// StromeManager.initiate(bundle: customBundle)
/// ```
///
/// - Note: It's recommended to initialize the `StromeManager` with the appropriate bundle before accessing its functionality.
final public class StromeManager: NSObject {
    /// The bundle from which resources will be loaded. Default is `Bundle.main`.
    ///
    /// The `bundle` property determines the bundle from which resources (such as images, sounds, or other assets) will be loaded by Strome. By default, it is set to `Bundle.main`, indicating the main bundle of the application. However, developers can assign a custom bundle to this property using the `initiate(bundle:)` method.
    ///
    /// - Warning: Modifying the `bundle` property after resources have been loaded may lead to unexpected behavior.
    public var bundle: Bundle = Bundle.main
    
    /// Singleton instance of `StromeManager`.
    ///
    /// The `shared` property provides access to a singleton instance of `StromeManager`. This ensures that there is only one instance of `StromeManager` throughout the application lifecycle, allowing for consistent configuration and resource loading behavior.
    public static var shared: StromeManager = StromeManager()
    
    /// Private initializer to prevent external instantiation of `StromeManager`.
    ///
    /// The private initializer ensures that `StromeManager` cannot be instantiated externally. This is essential for maintaining the singleton pattern, where only one instance of the class exists globally within the application.
    private override init() {}
    
    /// Initiates the `StromeManager` with a custom bundle.
    ///
    /// The `initiate(bundle:)` method allows for the initialization of the `StromeManager` with a custom bundle. This enables developers to specify a different bundle from which Strome will load its resources, providing flexibility in resource management.
    ///
    /// - Parameter bundle: The bundle from which resources will be loaded.
    ///
    /// Usage Example:
    ///
    /// ```swift
    /// let customBundle = Bundle(identifier: "com.example.CustomBundle")
    /// StromeManager.initiate(bundle: customBundle)
    /// ```
    ///
    /// - Note: It's recommended to initialize the `StromeManager` with the appropriate bundle before accessing its functionality.
    public static func initiate(bundle: Bundle) {
        Self.shared.bundle = bundle
    }
}
