//
//  LoginState.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/28/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import Foundation

enum LoginState {
    case loggedIn
    case loggedOut
}

class LoginStateProvider: ObservableObject {
    @Published var loginState: LoginState = .loggedOut
}
