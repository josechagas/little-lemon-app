//
//  NameFormField.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct NameFormField: View {
    @StateObject var controller: NameFormFieldController
    var body: some View {
        FormField(controller: controller) { state in
            HStack {
                Text("NAME:")
                TextField("Your name...", text: $controller.value)
                    .textContentType(.name)
                    .foregroundColor(state.hasError ? .red : nil)
            }
        }
    }
}

struct NameFormField_Previews: PreviewProvider {
    static var previews: some View {
        NameFormField(
            controller: NameFormFieldController(initialValue: "")
        )
    }
}

class NameFormFieldController: FormFieldController<String> {
    override func validate() {
        guard !value.isEmpty else {
            state = .invalid(message: "This field can not be blank")
            return
        }
        state = .valid
    }
}
