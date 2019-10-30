//
//  Ledger.swift
//  SwiftUIHackDay
//
//  Created by Eric Ludlow on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import Foundation

struct Ledger {
    var assets: Double {
        return books
            .filter() { $0.accountType.equityType == .asset }
            .reduce(0.0) { $0 + $1.balance }
    }
    
    var debt: Double {
        return books
            .filter() { $0.accountType.equityType == .debt }
            .reduce(0.0) { $0 + $1.balance }
    }
    
    var books: [Book]
}

struct Book: Identifiable {
    private static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var id: Int {
        return accounts.first?.accountNumber ?? 0
    }
    
    let accountType: AccountType
    var balance: Double {
        return accounts.reduce(0.0) { $0 + $1.balance }
    }
    
    var accounts: [Account]
    
    var balanceString: String {
        return Book.currencyFormatter.string(from: NSNumber(value: balance)) ?? "$0.00"
    }
}

struct Account: Identifiable {
    private static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var id: Int {
        return accountNumber
    }
    
    var balanceString: String {
        return Account.currencyFormatter.string(from: NSNumber(value: balance)) ?? "$0.00"
    }
    
    let accountType: AccountType
    let name: String
    let institution: String
    let accountNumber: Int
    let balance: Double
    let logo: String
}

enum AccountType: String {
    case cash = "Cash"
    case creditCards = "Credit Cards"
    case investments = "Investments"
    case loans = "Loans"
    case property = "Property"
    
    enum EquityType {
        case asset, debt
    }
    
    var equityType: EquityType {
        switch self {
        case .cash, .investments, .property:
            return .asset
        case .creditCards, .loans:
            return .debt
        }
    }
}
