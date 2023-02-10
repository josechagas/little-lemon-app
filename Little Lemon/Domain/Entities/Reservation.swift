//
//  Reservation.swift
//  LittleLemonProject
//
//  Created by Herrera-Camara, Jorge on 08/02/23.
//

import Foundation

struct Reservation {
    var restaurant: RestaurantLocation
    var customerName: String
    var customerEmail: String
    var customerPhoneNumber: String
    var reservationDate: Date
    var party: Int
    var specialRequests: String
    var id = UUID()
}
