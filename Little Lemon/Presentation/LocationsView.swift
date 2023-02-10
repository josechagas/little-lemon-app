//
//  LocationsView.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 08/02/23.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var model: Model
    @State private var titleText: String = "Select a location"
    
    @State private var navigationPath: NavigationPath = NavigationPath()
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding([.top], 50)

            Text(titleText)
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            ///Navigation option 1 -  the old way
//            NavigationView {
//                List(model.restaurants) { restaurant in
//                    NavigationLink(destination: ReservationForm(restaurant: restaurant)) {
//                        RestaurantLocationView(
//                            restaurant: restaurant
//                        )
//                    }
//                    .listSectionSeparator(.hidden)
//                }
//                .listStyle(.plain)
//                .padding([.leading, .trailing], 40)
//                .padding([.top, .bottom], 8)
//                .navigationTitle("")
//            }
//            .toolbar(.hidden, for: .navigationBar)
            
            ///Navigation option 2 - the new way
            NavigationStack(path: $navigationPath) {
                List(model.restaurants) { restaurant in
                    NavigationLink(value: restaurant) {
                        RestaurantLocationView(
                            restaurant: restaurant
                        )
                    }
                }
                .listStyle(.plain)
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: RestaurantLocation.self, destination: { data in
                    ReservationForm(restaurant: data)
                })
            }
        }
        .onAppear {
            defineTitleText(isDisplayingForm: model.displayingReservationForm)
        }
        .onChange(of: model.displayingReservationForm, perform: defineTitleText(isDisplayingForm:))
        .padding()
    }
    
    
    private func defineTitleText(isDisplayingForm: Bool) {
        titleText = isDisplayingForm ? "Reservation Details" : "Select a location"

    }
    
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(Model())
    }
}
