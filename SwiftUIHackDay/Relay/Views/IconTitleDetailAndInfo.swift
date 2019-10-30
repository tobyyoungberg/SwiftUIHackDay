//
//  IconTitleDetailAndInfo.swift
//  SwiftUIHackDay
//
//  Created by Eric Ludlow on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct IconTitleDetailAndInfo: View {
    var account: Account
    
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.circle")
            VStack(alignment: .leading) {
                Text(account.name)
                    .font(.headline)
                Text(account.institution)
                    .font(.footnote)
            }
            .padding(EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0))
            Spacer()
            Text(account.balanceString)
                .font(.subheadline)
        }
        .padding(EdgeInsets(top: 8.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
        .background(Color.white)
        .overlay(CustomDivider(height: 1.0, color: .gray),
                 alignment: .top)
    }
}

struct IconTitleDetailAndInfo_Previews: PreviewProvider {
    static var previews: some View {
        let account: Account = Account(accountType: .cash,
                                       name: "Checking",
                                       institution: "My Bank",
                                       accountNumber: 12345,
                                       balance: 12345.67890,
                                       logo: "My Bank")
        return IconTitleDetailAndInfo(account: account)
    }
}
