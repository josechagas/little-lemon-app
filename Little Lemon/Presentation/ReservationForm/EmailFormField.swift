//
//  EmailFormField.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct EmailFormField: View {
    @StateObject var controller: EmailFieldController
    var body: some View {
        FormField(controller: controller) { state in
            HStack {
                Text("EMAIL:")
                TextField("Your e-mail...", text: $controller.value)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .foregroundColor(state.hasError ? .red : nil)
            }
        }
    }
}

struct EmailFormField_Previews: PreviewProvider {
    static var previews: some View {
        EmailFormField(
            controller: EmailFieldController(initialValue: "")
        )
    }
}

class EmailFieldController: FormFieldController<String> {
    override func validate() {
        guard value.isEmpty else {
            state = .valid
            return
        }
        state = .invalid(message: "This field can not be blank")
    }
}
