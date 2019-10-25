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
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Sign in")
            TextField("email", text: $emailText)
                .frame(height: 50)
                .border(Color.black, width: 1.2)
            TextField("paswword", text: $passwordText)
                .frame(height: 50)
                .border(Color.black, width: 1.2)
            Button(action: signInButtonTapped, label: {
                Text("Sign in")
            })
            Button(action: forgotPasswordButtonTapped, label: {
                Text("Forgot password?")
            })
            Spacer()
            Text("Version 1.7.30")
            Text("By click \"Sign in\" you agree to our Terms of Service and Privacy Policy")

            

        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

    }
    
    private func signInButtonTapped() {
        
    }
    
    private func forgotPasswordButtonTapped() {
        
    }

}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
