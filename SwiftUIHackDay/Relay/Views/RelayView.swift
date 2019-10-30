//
//  RelayView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct RelayView: View {
    
    private let ledger = fakeLedger
    
    var body: some View {
        NavigationView {
            List {
                ThreeInfosWithSubtitle()
                ForEach(ledger.books) { book in
                    Section {
                        TitleAndDetail(book: book)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(book.accounts) { account in
                            IconTitleDetailAndInfo(account: account)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                }
            }
            .navigationBarTitle("All Accounts")
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
        }
    }
    
}

struct RelayView_Previews: PreviewProvider {
    static var previews: some View {
        RelayView()
    }
}
