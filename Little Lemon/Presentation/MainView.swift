//
//  MainView.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 08/02/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            LocationsView()
                .tag(0)
                .tabItem {
                    Label("Locations", systemImage: "fork.knife")
                }
                .toolbar( model.displayingReservationForm ? .hidden : .visible, for: .tabBar)
            ReservationView()
                .tag(1)
                .tabItem {
                    Label("Reservation", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}
