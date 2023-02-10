//
//  RestaurantLocationView.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 08/02/23.
//

import SwiftUI

struct RestaurantLocationView: View {
    var restaurant: RestaurantLocation
    var body: some View {
        VStack(alignment: .leading){
            Text(restaurant.city)
                .font(.title2)
            HStack {
                Text(restaurant.neighborhood)
                Text(" - ")
                Text(restaurant.phoneNumber)
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
    }
}

struct RestaurantLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantLocationView(
            restaurant: RestaurantLocation(
                city: "Las Vegas",
                neighborhood: "Downtown",
                phoneNumber: "(702) 555-9898"
            )
        )
    }
}
