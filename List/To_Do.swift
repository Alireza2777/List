//
//  To_Do.swift
//  List
//
//  Created by Alireza Karimi on 2023-05-30.
//

import Foundation

import Foundation

struct To_Do: Equatable, Codable {
    let id : UUID
    let title: String
    var isComplete: Bool
    let dueDate: Date
    let notes: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    
    
    static func ==(lhs: To_Do, rhs: To_Do) -> Bool {
        lhs.id == rhs.id
    }
  
  
  
    
    static func loadToDos() -> [To_Do]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {return nil}
        let decoder = PropertyListDecoder()
      
        return try? decoder.decode(Array<To_Do>.self, from: codedToDos)
    }
  
  
  
    static func saveToDos(_ toDos: [To_Do]) {
        let encoder = PropertyListEncoder()
      
        let coded = try? encoder.encode(toDos)
      
        try? coded?.write(to: archiveURL, options:  .noFileProtection)
    }
  
  
  
  
  
  
  
    static func loadSampleToDos() -> [To_Do]{
        let toDo1 = To_Do(title: "To Do One", isComplete: true, dueDate: Date(), notes: "Notes 1")
        let toDo2 = To_Do(title: "To Do Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let toDo3 = To_Do(title: "To Do Three", isComplete: true, dueDate: Date(), notes: "Notes 3")
        return [toDo1, toDo2, toDo3]
    }
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.id = UUID()
      
        self.title = title
        self.isComplete = isComplete
      
      
      
        self.dueDate = dueDate
        self.notes = notes
    }
}
