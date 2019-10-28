//
//  AccountHeaderView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct AccountHeaderView: View {
    @Binding var accountSummary: MemberHomeFeedAccountSummary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Hello, Toby!")
                .font(Font.system(size: 32, weight: .bold, design: .default))
                .padding()
            ForEach(accountSummary.accounts) { account in
                HStack {
                    Text(account.title ?? "")
                        .font(Font.system(size: 16, weight: .medium))
                        .foregroundColor(Color("black400"))
                    Spacer()
                    Text(account.balance ?? "")
                        .font(Font.system(size: 16, weight: .medium))
                        .foregroundColor(Color("black400"))
                }
                .padding(.leading)
                .padding(.trailing)
                Divider().foregroundColor(Color("gray-200"))
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .padding(.bottom)
            .background(Color("white"))
    }
}

struct AccountHeaderView_Previews: PreviewProvider {
    @State static var viewModel: MemberHomeViewModel = MemberHomeViewModel(accountSummary: MemberHomeFeedAccountSummary(accounts: [
        MemberHomeFeedAccount(id: "a", product: "Money", title: "MoneyAccount", balance: "$100.00", lastUpdated: nil, action: nil),
        MemberHomeFeedAccount(id: "b", product: "Loans", title: "Person Loan", balance: "$2,000.43", lastUpdated: nil, action: nil)
    ]))
    
    static var previews: some View {
        AccountHeaderView(accountSummary: $viewModel.accountSummary).previewLayout(PreviewLayout.sizeThatFits)
    }
}
