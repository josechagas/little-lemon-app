//
//  ReservationView.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var model: Model
    var body: some View {
        ScrollView {
            VStack {
                LittleLemonLogo()

                if let reservation = model.reservation {
                    Text("RESERVATION")
                        .padding([.leading, .trailing], 40)
                        .padding([.top, .bottom], 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .padding([.bottom], 20)

                    HStack {
                        VStack (alignment: .leading) {
                            Text("Restaurant")
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            RestaurantLocationView(restaurant: reservation.restaurant)
                            
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    
                    Divider()
                        .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            Text("NAME: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(reservation.customerName)
                            Spacer()
                        }
                        HStack {
                            Text("E-MAIl: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(reservation.customerEmail)
                            Spacer()
                        }
                        HStack {
                            Text("PHONE: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(reservation.customerPhoneNumber)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("PARTY: ")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Text("\(reservation.party)")
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            Text("DATE: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(reservation.reservationDate, style: .date)
                            Spacer()
                        }
                        HStack {
                            Text("TIME: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(reservation.reservationDate, style: .date)
                            Spacer()
                        }
                    }.padding(.bottom, 20)
                    
                    
                    HStack {
                        VStack (alignment: .leading){
                            Text("SPECIAL REQUESTS:")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(reservation.specialRequests)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    
                } else {
                    VStack{
                        Text("No Reservation yet")
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
            .padding(50)
        }
    }
}

struct ReservatonsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView().environmentObject(Model())
    }
}
