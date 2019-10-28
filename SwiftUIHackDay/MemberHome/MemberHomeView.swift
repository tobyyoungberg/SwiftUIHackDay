//
//  MemberHomeView.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct MemberHomeView: View {
    @ObservedObject var viewModel: MemberHomeViewModel
    
    init(_ container: Container = .shared) {
        let client: MemberHomeFeedClient = container.resolve()
        viewModel = client.viewModel
        
        let customAppearance = UINavigationBarAppearance()
        
        customAppearance.configureWithOpaqueBackground()
        customAppearance.shadowImage = nil
        customAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = customAppearance
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AccountHeaderView(accountSummary: $viewModel.accountSummary)
                    ForEach(viewModel.feedPage.content) { card in
                        SmallImageMemberFeedCell(card: card)
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .background(Color("gray-200"))
            .navigationBarItems(
            leading:
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
