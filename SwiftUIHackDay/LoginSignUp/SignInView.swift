//
//  signUpView.swift
//  SwiftUIHackDay
//
//  Created by Jayden Garrick on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State var emailText = ""
    @State var passwordText = ""
    
    private let fontName = "AvenirNext-DemiBold"
    @State var isPasswordHidden = true
    @State var showMainView = false
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack {
                Text("Sign in")
                    .font(Font.custom(fontName, size: 24))
                    .foregroundColor(Color("black"))
                    .bold()
                Spacer()
            } // HStack
            TextField("email", text: $emailText)
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            HStack {
                SecureField("password", text: $passwordText)
                Button(action: eyeButtonTapped, label: {
                    Image(systemName: self.isPasswordHidden ? "eye.slash.fill" : "eye.fill").padding(.trailing, 8)
                })
                    .foregroundColor(Color("ocean-400"))
            } // HStack
                .frame(height: 50)
                .padding(.leading, 4)
                .border(Color.black, width: 1.2)
            Button(action: signInButtonTapped, label: {
                Text("Sign in")
                    .foregroundColor(Color("white"))
                    .font(Font.custom(fontName, size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width - 35, height: 55)
                    .background(Color("ocean-400"))
                    .cornerRadius(5)
                
            }).padding(.top, 18)
            Button(action: forgotPasswordButtonTapped, label: {
                Text("Forgot password?")
                    .foregroundColor(Color("ocean-400"))
                    .font(Font.custom(fontName, size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width - 35, height: 55)
                
            })
            Spacer()
            Text("Version 1.7.30")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            Text("By click \"Sign in\" you agree to our Terms of Service and Privacy Policy")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        } // Top VSTack
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .overlay(self.showMainView ? MainView() : nil)
            
        
    }
    
    private func signInButtonTapped() {
        showMainView.toggle()
    }
    
    private func forgotPasswordButtonTapped() {
        
    }
    
    private func eyeButtonTapped() {
        isPasswordHidden.toggle()
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
