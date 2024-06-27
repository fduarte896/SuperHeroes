//
//  ContentView.swift
//  SuperHeroes
//
//  Created by Felipe Duarte on 3/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MasterView()
                .tabItem { Label("Héroes", systemImage: "person.fill") }
            ModalView()
                .tabItem { Label("Héroes", systemImage: "person.fill") }
            Text("Pantalla 3")
                .tabItem { Label("Héroes", systemImage: "person.fill") }
        }
    }
}


#Preview {
    ContentView()
}
