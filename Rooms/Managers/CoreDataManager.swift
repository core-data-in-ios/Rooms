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
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        persistentContainer = NSPersistentContainer(name: "RoomModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("failed to initialize CoreData\n\(error.localizedDescription)")
            }
        }
    }
    
    func getAllRooms() -> [Room] {
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to get any rooms")
            return []
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
