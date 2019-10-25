//
//  AccountHeaderView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct AccountHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, Toby!")
                .font(Font.system(size: 32, weight: .bold, design: .default))
                .padding()
            HStack {
                Text("Money")
                    .font(Font.system(size: 16, weight: .medium))
                    .foregroundColor(Color("black400"))
                Spacer()
                Text("$60.05")
                    .font(Font.system(size: 16, weight: .medium))
                    .foregroundColor(Color("black400"))
            }
            .padding(.leading)
            .padding(.trailing)
            Divider().foregroundColor(Color("gray-200"))
            HStack {
                Text("Crypto Invest")
                    .font(Font.system(size: 16, weight: .medium))
                    .foregroundColor(Color("black400"))
                Spacer()
                Text("$51.33")
                    .font(Font.system(size: 16, weight: .medium))
                    .foregroundColor(Color("black400"))
            }
            .padding(.leading)
            .padding(.trailing)
            Divider().foregroundColor(Color("gray-200"))
            HStack {
                Text("Active Invest")
                    .font(Font.system(size: 16, weight: .medium))
                    .foregroundColor(Color("black400"))
                Spacer()
                Text("$1.06")
                    .font(Font.system(size: 16, weight: .medium))
                    .foregroundColor(Color("black400"))
            }
            .padding(.leading)
            .padding(.trailing)
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .padding(.bottom)
            .background(Color("white"))
    }
}

struct AccountHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountHeaderView().previewLayout(PreviewLayout.sizeThatFits)
        }
    }
}
