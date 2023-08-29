//
//  MyTitle.swift
//  GuessTheFlag
//
//  Created by Anton Gerasimov on 28.08.2023.
//

import SwiftUI

struct MyTitle: ViewModifier {
    
    func body(content: Content ) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}
