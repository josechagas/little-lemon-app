//
//  Restaurant.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import Foundation

struct RestaurantLocation: Identifiable, Hashable {
    let id: UUID = UUID()
    let city: String
    let neighborhood: String
    let phoneNumber: String
}
