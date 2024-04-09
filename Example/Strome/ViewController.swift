//
//  ViewController.swift
//  Strome
//
//  Created by Ravi on 04/03/2024.
//  Copyright (c) 2024 Ravi. All rights reserved.
//

import UIKit
import Strome

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StromeManager.initiate(bundle: Bundle.main)
        
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

struct User: PersistableEntity {
    @EntityRelationship var name: Name
    @EntityField var age: Int
    @EntityField var phoneNumbers: [String]?
    @EntityRelationship var addresses: [Address]?
    
    var fullName: String { self.name.fullName }
}

struct Name: PersistableEntity {
    @EntityField var firstName: String
    @EntityField var middleName: String?
    @EntityField var lastName: String?
    
    var fullName: String {
        var fullName = ""
        fullName.append(self.firstName)
        if let middleName = self.middleName { fullName.append((" " + middleName)) }
        if let lastName = self.middleName { fullName.append((" " + lastName)) }
        return fullName
    }
    
}

struct Address: PersistableEntity {    
    @EntityField var houseNumber: String
    @EntityField var city: String
    @EntityField var state: String
    @EntityField var pinCode: String
}

struct FetchABC: PersistableFetchEntity {
    typealias Entity = User
    
    var name: String
    var age: Int
}

//extension PersistableRelationship {
//    var deleteRule: PersistableDeleteRule { .cascade }
//    var relationshipType: PersistableRelationshipType { .auto }
//}

//generic Example
@propertyWrapper
struct CustomRelation<T: PersistableEntity>: PersistableRelationship {
    var wrappedValue: T
    typealias Entity = T
    
    var deleteRule: PersistableDeleteRule = .cascade
    var relationshipType: PersistableRelationshipType = .auto
}

// for single enitiy example
@propertyWrapper
struct CustomUserRelation: PersistableRelationship {
    var wrappedValue: User
    typealias Entity = User
    var deleteRule: PersistableDeleteRule = .cascade
    var relationshipType: PersistableRelationshipType = .auto
}
