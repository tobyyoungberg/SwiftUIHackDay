//
//  SmallImageMemberFeedCell.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import SwiftUI

struct SmallImageMemberFeedCell: View {
    var card: MemberHomeFeedCard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image("sofiIcon")
                Text(card.header?.title ?? "")
                    .font(Font.system(size: 14))
                    .foregroundColor(Color("black400"))
                Spacer()
                Button(action: {}) {
                    Image("Money-Overflow")
                }.accentColor(Color("black400"))
            }
            Text(card.data?.title ?? "")
                .font(Font.system(size: 16, weight: .bold))
            HStack(alignment: .top) {
                Text(card.data?.description ?? "")
                .font(Font.system(size: 16))
                Spacer()
                Image("testImage")
                    .resizable()
                    .frame(minWidth: 0, maxWidth: 80, minHeight: 0, maxHeight: 80)
            }.frame(minWidth: 0, maxWidth: .infinity)
            Divider().foregroundColor(Color("gray-200"))
            HStack(spacing: 32) {
                ForEach(card.primaryActions ?? []) { action in
                    Button(action: {
                     }) {
                        Text(action.text ?? "")
                            .font(Font.system(size: 16, weight: .bold))
                     }
                }
            }
        }
        .accentColor(Color("turquoise400"))
        .padding()
        .background(Color("white"))
    }
}

struct SmallImageMemberFeedCell_Previews: PreviewProvider {
    static var previews: some View {
        let client: MemberHomeFeedClient = Container.shared.resolve()
        
        return SmallImageMemberFeedCell(card: client.viewModel.feedPage.content[15]).previewLayout(.sizeThatFits)
    }
}
