//
//  MemberHomeView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct MemberHomeView: View {
    
    init() {
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AccountHeaderView()
                    MemberFeedCell()
                    SmallImageMemberFeedCell()
                    MemberFeedCell()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color("gray-200"))
            }
            .navigationBarItems(leading:
                Button(action: {
                    print("Profile")
                }) {
                    Image("profile")
                }.accentColor(Color("black400")),
            trailing:
                Button(action: {
                    print("Notifications")
                }) {
                    Image("notificationbell")
                }.accentColor(Color("black-200"))
            )
                .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct MemberHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MemberHomeView()
    }
}
