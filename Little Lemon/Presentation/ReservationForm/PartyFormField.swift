//
//  PartyFormField.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct PartyFormField: View {
    
    @StateObject var controller: PartyFormFieldController
    
    var body: some View {
        FormField(controller: controller) { state in
            HStack {
                Text("PARTY:")
                TextField("Number", value: $controller.value, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .foregroundColor(state.hasError ? .red : nil)
            }
        }
    }
}

struct PartyFormField_Previews: PreviewProvider {
    static var previews: some View {
        PartyFormField(
            controller: PartyFormFieldController(initialValue: 1)
        )
    }
}

class PartyFormFieldController: FormFieldController<Int> {
    override func validate() {
        guard value > 0 else {
            state = .invalid(message: "Must be bigger than 0")
            return
        }
        self.state = .valid
    }
}
