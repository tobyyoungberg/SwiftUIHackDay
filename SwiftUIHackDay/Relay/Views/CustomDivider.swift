//
//  CustomDivider.swift
//  SwiftUIHackDay
//
//  Created by Eric Ludlow on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct CustomDivider: View {
    var height: CGFloat = 1.0
    
    var color: Color = .gray
    
    var body: some View {
        Text("Divider")
            .frame(maxWidth: .infinity, maxHeight: height)
            .foregroundColor(.clear)
            .background(self.color)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider(height: 4.0)
    }
}
