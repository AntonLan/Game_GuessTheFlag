//
//  FlagImageComponent.swift
//  GuessTheFlag
//
//  Created by Anton Gerasimov on 28.08.2023.
//

import SwiftUI

struct FlagImage: View {
    var nameCountrie: String
    
    var body: some View {
        Image(nameCountrie)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
