//
//  MemberFeedCell.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct MemberFeedCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image("sofiIcon")
                Text("Community")
                    .font(Font.system(size: 14))
                    .foregroundColor(Color("black400"))
                Spacer()
                Button(action: {}) {
                    Image("Money-Overflow")
                }.accentColor(Color("black400"))
            }
            Text("How do you compare?")
                .font(Font.system(size: 16, weight: .bold))
            Text("Knowledge is power. With our community Insights tool, see how you stak up to your peers on matters of income, credit score, student debt, and more.")
                .font(Font.system(size: 16))
            Divider().foregroundColor(Color("gray-200"))
            Button(action: {
            }) {
                Text("See Comparison")
                    .font(Font.system(size: 16, weight: .bold))
            }
        }
        .accentColor(Color("turquoise400"))
        .padding()
        .background(Color("white"))
    }
}

struct MemberFeedCell_Previews: PreviewProvider {
    static var previews: some View {
        MemberFeedCell().previewLayout(.sizeThatFits)
    }
}
