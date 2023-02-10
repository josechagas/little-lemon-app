//
//  ReservationForm.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 08/02/23.
//

import SwiftUI

struct ReservationForm: View {
    @Environment(\.dismiss) private var dismiss
    
    
    var restaurant: RestaurantLocation
    

    @EnvironmentObject private var model: Model
    
    @StateObject private var dateFieldController: DateTimeFormFieldController = DateTimeFormFieldController(initialValue: Date())
    @StateObject private var partyFieldController: PartyFormFieldController = PartyFormFieldController(initialValue: 0)
    @StateObject private var nameFieldController: NameFormFieldController = NameFormFieldController(initialValue: "")
    @StateObject private var phoneFieldController: PhoneFormFieldController = PhoneFormFieldController(initialValue: "")
    @StateObject private var emailFieldController: EmailFieldController = EmailFieldController(initialValue: "")
    @State private var optionalRequest: String = ""

    @State private var showFormInvalidMessage: Bool = false
    
    var isFormValid: Bool {
        return dateFieldController.isvalid &&
        partyFieldController.isvalid &&
        nameFieldController.isvalid &&
        phoneFieldController.isvalid &&
        emailFieldController.isvalid
    }
    
    var body: some View {
        List {
            RestaurantLocationView(
                restaurant: restaurant
            )
            .listSectionSeparator(.hidden)
            DateTimeFormField(controller: dateFieldController)
                .padding([.top, .bottom])
            PartyFormField(controller: partyFieldController)
            NameFormField(controller: nameFieldController)
            PhoneFormField(controller: phoneFieldController)
            EmailFormField(controller: emailFieldController)
            TextField("add any special request (optional)", text: $optionalRequest, axis: .vertical)
                .keyboardType(.alphabet)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray.opacity(0.2))
                }
                .padding([.top, .bottom])

            Button("Confirm Reservation".uppercased()){
                onConfirmButtonClick()
            }
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .buttonStyle(.borderedProminent)
            .padding([.top, .bottom])
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollDismissesKeyboard(.interactively)
        .alert("Validation Error", isPresented: $showFormInvalidMessage, actions: {
            Button("OK", action: {})
        }, message: {
            Text("You did not filled the form correctly! Please review the informations provided")
        })
        .onAppear {
            model.displayingReservationForm = true
        }
        .onDisappear {
            model.displayingReservationForm = false
        }
            
    }
    
    private func onConfirmButtonClick() {
        validateForm()
        if isFormValid {
            let reservation = Reservation(
                restaurant: restaurant,
                customerName: nameFieldController.value,
                customerEmail: emailFieldController.value,
                customerPhoneNumber: phoneFieldController.value,
                reservationDate: dateFieldController.value,
                party:partyFieldController.value,
                specialRequests: optionalRequest
            )
            model.reservation = reservation
            dismiss()
        } else {
            showFormInvalidMessage = true
            print("Show some error alert")
        }
    }
    
    private func validateForm() {
        phoneFieldController.validate()
        partyFieldController.validate()
        nameFieldController.validate()
        emailFieldController.validate()
        dateFieldController.validate()
    }
}

struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm(
            restaurant: Model().restaurants[0]
        )
            .environmentObject(Model())
    }
}
