//
//  GetYourMoneyRightView.swift
//  SwiftUIHackDay
//
//  Created by Jayden Garrick on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct GetYourMoneyRightView: View {
    
    private let fontName = "AvenirNext-Heavy"
    private let fontSize: CGFloat = 90

    var body: some View {
        VStack(alignment: .leading, spacing: -20) {
            Text("Get")
                .font(Font.custom(fontName, size: fontSize))
                .foregroundColor(.white)
            Text("Your")
                .font(Font.custom(fontName, size: fontSize))
                .foregroundColor(.white)
            
            Text("Money")
                .font(Font.custom(fontName, size: fontSize))
                .foregroundColor(Color("eggplant-400"))
            
            Text("Right")
                .font(Font.custom(fontName, size: fontSize))
                .foregroundColor(.white)
            
            Text("Save. Spend. Borrow. Invest.")
                .font(Font.custom(fontName, size: 20))
                .foregroundColor(Color("eggplant-400"))
                .padding(.top)
        }
    }
}

struct GetYourMoneyRightView_Previews: PreviewProvider {
    static var previews: some View {
        GetYourMoneyRightView()
    }
}
