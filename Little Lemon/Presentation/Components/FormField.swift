//
//  FormField.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct FormField<Value: Equatable, Content: View>: View {

    typealias FormFieldContent = (FormFieldState) -> Content
    
    @StateObject var controller: FormFieldController<Value>
    @ViewBuilder var content: FormFieldContent
            
    var body: some View {
        VStack(alignment: .leading){
            content(controller.state)
            if case .invalid(let message) = controller.state {
                Text(message)
                    .font(.caption2)
                    .foregroundColor(.red)
            }
        }.onChange(of: controller.value) { _ in
            withAnimation {
                controller.validate()
            }
        }
    }
}

enum FormFieldState: Equatable {
    case none
    case valid
    case invalid(message: String)
    
    var hasError: Bool {
        guard case .invalid(_) = self else {
            return false
        }
        return true
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(controller: FormFieldController(initialValue: 1)) { state in
            TextField("Some input field", value: .constant(0), formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
        }
    }
}

class FormFieldController<Value: Equatable>: ObservableObject {
    @Published var value: Value
    @Published var state: FormFieldState = .none
    
    var isvalid: Bool {
        return !state.hasError
    }

    init(initialValue: Value) {
        self.value = initialValue
    }
    
    func validate() {
        fatalError("Must be implemented")
    }
}
