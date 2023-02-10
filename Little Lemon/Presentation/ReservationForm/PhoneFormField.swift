//
//  PhoneFormField.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct PhoneFormField: View {
    @StateObject var controller: PhoneFormFieldController
    var body: some View {
        FormField(controller: controller) { state in
            HStack {
                Text("PHONE:")
                TextField("Your phone number...", text: $controller.value)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                    .foregroundColor(state.hasError ? .red : nil)
            }
        }
    }
}

struct PhoneFormField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneFormField(
            controller: PhoneFormFieldController(initialValue: "")
        )
    }
}

class PhoneFormFieldController: FormFieldController<String> {
    override func validate() {
        guard !value.isEmpty else {
            state = .invalid(message: "This field can not be blank")
            return
        }
        state = .valid
    }
}
