//
//  signUpView.swift
//  SwiftUIHackDay
//
//  Created by Jayden Garrick on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

// Check Mark filled = "checkmark.square"
// UNchecked check mark = "square"

fileprivate let agreement = """
I have read, udnerstood and consent to the language and authorizations outlined in SoFi's ESIGN Act Consent, Privacy Policy, Terms of Use and Arbitration Agreement. We recommend that you retain a copy for your reference
"""

struct SignUpView: View {
    private let fontName = "AvenirNext-DemiBold"
    
    @State var firstName = ""
    @State var lastName = ""
    @State var stateOfResidence = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var isChecked = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Registration")
                    .font(Font.custom(fontName, size: 24))
                    .foregroundColor(Color("black"))
                    .bold()
                Spacer()
            } // HStack

            TextField("First Name", text: $firstName)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            
            TextField("Last Name", text: $lastName)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            
            TextField("State of Residence", text: $stateOfResidence)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            
            TextField("Email", text: $email)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            
            TextField("Password", text: $password)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            
            TextField("Confirm Password", text: $confirmPassword)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            
            Text(agreement)
                .foregroundColor(.gray)
            
            HStack {
                Button(action: agreeButtonTapped, label: {
                    HStack {
                        Image(systemName: isChecked ? "checkmark.square" : "square")
                            .foregroundColor(Color("ocean-400"))                            
                        Text("I Agree").foregroundColor(Color("ocean-400"))
                    }
                }) // Button
                Spacer()
            }
            Button(action: registerButtonTapped, label: {
                Text("Register")
                    .foregroundColor(Color("white"))
                    .font(Font.custom(fontName, size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width - 35, height: 55)
                    .background(Color("ocean-400"))
                    .cornerRadius(5)
            })
        }
        .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)// VStack
    }
    
    func agreeButtonTapped() {
        isChecked.toggle()
    }
    
    func registerButtonTapped() {
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
