//
//  ToDo.swift
//  ToDoWithSwiftData
//
//  Created by Denilson Washuma on 24/06/2024.
//

import Foundation
import SwiftData


@Model // this macro (Model) makes it savable to store and retrieve from phone
class ToDo: Identifiable {
    
    var id:String = UUID().uuidString
    var title:String
    
    init(title: String) {
        self.title = title
       
    }
    
}
