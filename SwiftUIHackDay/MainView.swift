//
//  MainView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MemberHomeView()
                .tabItem {
                    Image("home")
                    Text("Home")
            }
            RelayView()
                .tabItem {
                    Image("relay")
                    Text("Relay")
            }
        }.accentColor(Color("turquoise400"))
        .edgesIgnoringSafeArea(.top)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
