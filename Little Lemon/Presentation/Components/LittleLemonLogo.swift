//
//  LittleLemonLogo.swift
//  Little Lemon
//
//  Created by José Lucas Souza das Chagas on 08/02/23.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        HStack {
            Image("little_lemon")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 60)
            VStack(alignment: .leading){
                Text("Little Lemon")
                Text("Restaurant")
            }
            .font(.title)
            .italic()
        }
    }
}

struct LittleLemonLogo_Previews: PreviewProvider {
    static var previews: some View {
        LittleLemonLogo()
    }
}
