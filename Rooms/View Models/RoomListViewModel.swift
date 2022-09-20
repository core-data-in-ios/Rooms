//
//  RoomListViewModel.swift
//  Rooms
//
//  Created by Chris Hand on 9/19/22.
//

import Foundation
import SwiftUI


class RoomListViewModel: ObservableObject {
    let coreDM: CoreDataManager
    
    @Published var rooms: [RoomViewModel] = [RoomViewModel]()
    
    init() {
        coreDM = CoreDataManager.shared
    }
    
    func populateRooms() {
        DispatchQueue.main.async {
            self.rooms = self.coreDM.getAllRooms().map(RoomViewModel.init)
        }
    }
}


struct RoomViewModel {
    let room: Room
    
    var roomId: ObjectIdentifier {
        return room.id
    }
    
    var color: UIColor {
        if (room.color == .clear) {
            return .green
        }
        
        return room.color ?? UIColor.gray
    }
    
    var name: String {
        return room.name ?? ""
    }
}
