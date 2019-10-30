//
//  MainContainerView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/28/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct MainContainerView: View {
    @EnvironmentObject var loginStateProvider: LoginStateProvider
    
    var body: some View {
        ZStack {
            LoginSignupView()
            if loginStateProvider.loginState == .loggedIn {
                MainView().transition(.opacity)
            }
        }
    }
    
    func currentView() -> AnyView {
        switch loginStateProvider.loginState {
        case .loggedOut:
            return AnyView(LoginSignupView())
        case .loggedIn:
            return AnyView(MainView().transition(.move(edge: .leading)))
        }
    }
}

struct MainContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MainContainerView()
    }
}
