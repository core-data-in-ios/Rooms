//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import SwiftUI

struct RoomListScreen: View {
    
    @State private var isPresented: Bool = false
    
    @StateObject private var roomListVM = RoomListViewModel()
    
    var body: some View {
        NavigationView {
            
            List(roomListVM.rooms, id:\.roomId) { room in
                HStack {
                    Text(room.name)
                }
            }
            
            .navigationTitle("All Rooms")
            .navigationBarItems(trailing: Button("Add New Room") {
                isPresented = true
            })
            .onAppear(perform: {
                roomListVM.populateRooms()
            })
            
            .sheet(isPresented: $isPresented, onDismiss: {
                
            } ,content: {
                AddRoomScreen()
            })
            
        }
    }
}

struct RoomListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoomListScreen()
    }
}
