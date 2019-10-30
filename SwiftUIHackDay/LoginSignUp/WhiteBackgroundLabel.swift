//
//  WhiteBackgroundButton.swift
//  SwiftUIHackDay
//
//  Created by Jayden Garrick on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct WhiteBackgroundLabel: View {
    let buttonText: String
    private let fontName = "Avenir-Heavy"
    
    var body: some View {
        Text(buttonText)
            .foregroundColor(Color("turquoise400"))
            .font(Font.custom(fontName, size: 15))
            .multilineTextAlignment(.center)
            .frame(width: UIScreen.main.bounds.width - 40, height: 55)
            .background(Color("white"))
        
    }
}

struct WhiteBackgroundButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteBackgroundLabel(buttonText: "Hello")
    }
}
