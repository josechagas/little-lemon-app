//
//  DateTimeFormField.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 09/02/23.
//

import SwiftUI

struct DateTimeFormField: View {

    @StateObject var controller: DateTimeFormFieldController
    
    var body: some View {
        FormField(controller: controller) { state in
            DatePicker("DATE:", selection: $controller.value, displayedComponents: [.date, .hourAndMinute])
        }
    }
}

struct DateTimeFormField_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeFormField(
            controller: DateTimeFormFieldController(initialValue: Date())
        )
    }
}

class DateTimeFormFieldController: FormFieldController<Date> {
    override func validate() {
        let state: FormFieldState
        if value <= Date() {
            state = .invalid(message: "The reservation date must be on future")
        } else {
            state = .valid
        }
        self.state = state
    }
}
