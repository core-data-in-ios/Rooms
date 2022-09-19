//
//  CoreDataManager.swift
//  Rooms
//
//  Created by Chris Hand on 9/18/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Room")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("failed to initialize CoreData\n\(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            fatalError("Failed to save Room!\n\(error.localizedDescription)")
        }
    }
}
