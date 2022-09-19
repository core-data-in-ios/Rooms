//
//  AddRoomViewModel.swift
//  Rooms
//
//  Created by Chris Hand on 9/18/22.
//

import Foundation
import SwiftUI

class AddRoomViewModel: ObservableObject {
    
    let coreDM: CoreDataManager = CoreDataManager.shared
    
    var name: String = ""
    var width: String = ""
    var length: String = ""
    var color: Color = Color.clear
    
    func saveRoom() {
        let room = Room(context: coreDM.persistentContainer.viewContext)
        room.name = name
        room.width = Double(width) ?? 0.0
        room.length = Double(length) ?? 0.0
        room.color = UIColor(color)
        
        coreDM.save()
    }
}
