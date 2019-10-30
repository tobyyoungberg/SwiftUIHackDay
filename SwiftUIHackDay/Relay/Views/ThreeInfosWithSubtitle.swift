//
//  ThreeInfosWithSubtitle.swift
//  SwiftUIHackDay
//
//  Created by Eric Ludlow on 10/30/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct ThreeInfosWithSubtitle: View {
    var body: some View {
        VStack {
            Text("$50,000")
                .font(.title)
                .fontWeight(.bold)
            Text("Net worth")
                .font(.body)
                .foregroundColor(.gray)
            HStack {
                VStack {
                    Text("$70,000")
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("Assets")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack {
                    Text("-$20,000")
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("Debt")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
    }
}

struct ThreeInfosWithSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        ThreeInfosWithSubtitle()
    }
}
