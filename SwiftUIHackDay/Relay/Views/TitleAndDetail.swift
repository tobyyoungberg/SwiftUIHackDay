//
//  TitleAndDetail.swift
//  SwiftUIHackDay
//
//  Created by Eric Ludlow on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct TitleAndDetail: View {
    var book: Book
    
    var body: some View {
        VStack {
            HStack {
                Text(book.accountType.rawValue)
                    .font(.headline)
                Spacer()
                Text(book.balanceString)
                    .font(.headline)
                
            }
            .padding(EdgeInsets(top: 18.0, leading: 16.0, bottom: 6.0, trailing: 16.0))
            .background(Color.white)
            .overlay(CustomDivider(height: 12.0, color: .gray),
                     alignment: .top)
        }
    }
}

struct TitleAndDetail_Previews: PreviewProvider {
    static var previews: some View {
        let book: Book = Book(accountType: .cash, accounts: [])
        return TitleAndDetail(book: book)
    }
}
