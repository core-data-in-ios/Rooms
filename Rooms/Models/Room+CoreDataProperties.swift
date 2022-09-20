//
//  Room+CoreDataProperties.swift
//  Rooms
//
//  Created by Chris Hand on 9/18/22.
//

import Foundation
import CoreData
import UIKit


// this was copied from the auto-generated class, but now it is mine, so I can do what I want in it
// Technically, I don't need to files, but this is how CoreData would do it. Just following that pattern.
extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var length: Double
    @NSManaged public var name: String?
    @NSManaged public var width: Double

}

extension Room : Identifiable {

}
