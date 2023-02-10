//
//  Model.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 08/02/23.
//

import Foundation

class Model: ObservableObject {
    @Published var tabViewSelectedIndex: Int = 0
    @Published var displayingReservationForm: Bool = false
    @Published var reservation: Reservation? = nil
    @Published var restaurants:[RestaurantLocation] = [
        RestaurantLocation(
            city: "Las Vegas",
            neighborhood: "Downtown",
            phoneNumber: "(702) 555-9898"
        ),
        RestaurantLocation(
            city: "Los Angeles",
            neighborhood: "North Hollywood",
            phoneNumber: "(213) 555-1453"
        ),
        RestaurantLocation(
            city: "Los Angeles",
            neighborhood: "Venice",
            phoneNumber: "(310) 555-1222"
        ),
        RestaurantLocation(
            city: "Nevada",
            neighborhood: "Venice",
            phoneNumber: "(725) 555-5454"
        ),
        RestaurantLocation(
            city: "San Francisco",
            neighborhood: "North Beach",
            phoneNumber: "(415) 555-1345"
        ),
        RestaurantLocation(
            city: "Union Square",
            neighborhood: "North Beach",
            phoneNumber: "(415) 555-9813"
        )

    ]
}
