//
//  Student.swift
//  53.Pr11.Bookworm
//
//  Created by Валентин on 02.07.2025.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
