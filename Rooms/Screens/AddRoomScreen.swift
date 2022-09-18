//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import SwiftUI

struct AddRoomScreen: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var name: String = ""
    @State private var width: String = ""
    @State private var length: String = ""
    @State private var color: Color = Color.clear 
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Enter room", text: $name)
                    TextField("Enter width", text: $width)
                    TextField("Enter length", text: $length)
                    ColorPicker("Select color", selection: $color)
                    
                    HStack {
                        Spacer()
                        Button("Save") {
                            
                        }
                        Spacer()
                    }

                }
            }
            .navigationTitle("Add Room")
        }
    }
}

struct AddRoomScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomScreen()
    }
}
