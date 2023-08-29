//
//  ContentFrame.swift
//  GuessTheFlag
//
//  Created by Anton Gerasimov on 28.08.2023.
//

import SwiftUI

struct ContentFrame: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
}
