//
//  LoginSignupView.swift
//  SwiftUIHackDay
//
//  Created by Jayden Garrick on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct LoginSignupView: View {
    private let fontName = "Avenir-Heavy"
    
    var body: some View {
        NavigationView {
                VStack(alignment: .center, spacing: 150) {
                    GetYourMoneyRightView()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                    VStack(alignment: .center, spacing: 5) {
                        NavigationLink(destination: SignUpView()) {
                            WhiteBackgroundLabel(buttonText: "Get Started")
                        }
                        
                        NavigationLink(destination: SignInView()) {
                            WhiteBackgroundLabel(buttonText: "Sign in with an existing account")
                        }
                        
                    }
                    .padding(.bottom, 50)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color("turquoise400"))
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    
    func getStartedButtonTapped() {
        
    }
    
    func signInButtonTapped() {
        
    }
}


struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
