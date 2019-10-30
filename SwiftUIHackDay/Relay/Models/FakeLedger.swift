//
//  FakeLedger.swift
//  SwiftUIHackDay
//
//  Created by Eric Ludlow on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import Foundation

let fakeLedger = Ledger(books: [
    Book(accountType: .cash, accounts: [
        Account(accountType: .cash,
                name: "Checking",
                institution: "Wells Fargo",
                accountNumber: 1234,
                balance: 1234,
                logo: "Wells Fargo"),
        
        Account(accountType: .cash,
                name: "Money",
                institution: "SoFi",
                accountNumber: 5678,
                balance: 5678,
                logo: "SoFi"),
        
        Account(accountType: .cash,
                name: "Savings",
                institution: "USAA",
                accountNumber: 2468,
                balance: 2468,
                logo: "USAA")
    ]),
    
    Book(accountType: .creditCards, accounts: [
        Account(accountType: .creditCards,
                name: "VISA",
                institution: "Wells Fargo",
                accountNumber: 4321,
                balance: -4321,
                logo: "Wells Fargo"),
        
        Account(accountType: .creditCards,
                name: "MasterCard",
                institution: "Chase",
                accountNumber: 5432,
                balance: -5432,
                logo: "Chase")
    ]),
    
    Book(accountType: .investments, accounts: [
        Account(accountType: .investments,
                name: "Brokerage",
                institution: "SoFi",
                accountNumber: 3333,
                balance: 3333,
                logo: "SoFi"),
        
        Account(accountType: .investments,
                name: "Portfolio",
                institution: "SoFi",
                accountNumber: 4444,
                balance: 4444,
                logo: "SoFi"),
        
        Account(accountType: .investments,
                name: "IRA",
                institution: "USAA",
                accountNumber: 2222,
                balance: 2222,
                logo: "USAA")
    ]),
    
    Book(accountType: .loans, accounts: [
        Account(accountType: .loans,
                name: "Mortgage",
                institution: "Wells Fargo",
                accountNumber: 543210,
                balance: -543210,
                logo: "Wells Fargo"),
        
        Account(accountType: .loans,
                name: "Student Loans",
                institution: "Sallie Mae",
                accountNumber: 321321,
                balance: -321321,
                logo: "Sallie Mae"),
        
        Account(accountType: .loans,
                name: "Mortgage",
                institution: "Bank of America",
                accountNumber: 2222222,
                balance: -2222222,
                logo: "Bank of America")
    ]),
    
    Book(accountType: .property, accounts: [
        Account(accountType: .property,
                name: "Sutherland Estate",
                institution: "",
                accountNumber: 654321,
                balance: 654321,
                logo: "house"),
        
        Account(accountType: .property,
                name: "Sunnyside Townhomes",
                institution: "",
                accountNumber: 2345678,
                balance: 2345678,
                logo: "house"),
        
        Account(accountType: .property,
                name: "S.S. Winchester",
                institution: "",
                accountNumber: 9876,
                balance: 9876,
                logo: "boat")
    ])
])
