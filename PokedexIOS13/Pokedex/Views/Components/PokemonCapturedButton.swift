//
//  PokemonCapturedButton.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/30/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonCapturedButton: View {
    
    @Binding var isCaptured : Bool
    
    var body: some View {
        Button(action: {self.isCaptured.toggle()}) {
            ZStack {
                RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
                    .stroke(isCaptured ? ViewConstants.capturedColor : ViewConstants.notCapturedColor, lineWidth: ViewConstants.strokeWidth)
                    .frame(width: ViewConstants.buttonWidth, height: ViewConstants.buttonHeight)
                Text(isCaptured ? "Mark as Released" : "Mark as Captured")
                    .foregroundColor(isCaptured ? ViewConstants.capturedColor : ViewConstants.notCapturedColor)
            }
        }
    }
}

struct PokemonCapturedButton_Previews: PreviewProvider {
    @State static var captured = false
    static var previews: some View {
        PokemonCapturedButton(isCaptured: $captured)
    }
}
