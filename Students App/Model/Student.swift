//
//  Student.swift
//  Students App
//
//  Created by Adi Amoyal on 11/05/2022.
//

import Foundation

class Student {
    var name = ""
    var id = ""
    var phone = ""
    var avatarUrl = ""
    var address = ""
    
    init() {
        
    }
    
    init(name: String, id: String, phone: String, avatarUrl: String, address: String) {
        self.name = name
        self.id = id
        self.phone = phone
        self.avatarUrl = avatarUrl
        self.address = address
    }
}
