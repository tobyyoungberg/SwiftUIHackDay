//
//  MemberHomeFeedPage.swift
//  Member
//
//  Created by Michael Mecham on 7/27/19.
//  Copyright © 2019 SoFi. All rights reserved.
//

import Foundation
//import Utilities

// MARK: - AccountSummary
public struct MemberHomeFeedAccountSummary: Equatable, Decodable {
    public var accounts: [MemberHomeFeedAccount]
}

public struct MemberHomeFeedAccount: Equatable, Decodable, Identifiable {
    public var id: String?
    public var product: String?
    public var title: String?
    public var balance: String?
    public var lastUpdated: Date?
    public var action: MemberHomeFeedAction?
}

// Old feed relies on this typealias. Can remove once the old feed is completely retired.
public typealias DashboardFeedPageFlags = MemberHomeFeedFlags
public struct MemberHomeFeedFlags: Codable {
    private enum CodingKeys: String, CodingKey {
        case mbhNewFeedToggle = "mbh-new-feed-toggle"
    }
    public var mbhNewFeedToggle: Bool

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mbhNewFeedToggle = try container.decodeIfPresent(Bool.self, forKey: .mbhNewFeedToggle) ?? false
    }
}

// MARK: - Feed
public struct MemberHomeFeedPage: Decodable {
    public var next: String?
    public var content: [MemberHomeFeedCard]
    public var flags: MemberHomeFeedFlags?
}

public struct MemberHomeFeedCard: Codable, Identifiable {

    private enum CardCodingKeys: String, CodingKey {
        case id, namespace, _self, template, instrumentation, header, primaryActions, data
    }

    public var id: String?
    public var namespace: String?
    public var _self: String?
    public var template: MemberHomeFeedTemplate
    public var header: MemberHomeFeedCardHeader?
    public var primaryActions: [MemberHomeFeedPrimaryAction]?
    public var data: MemberHomeFeedCardData?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CardCodingKeys.self)

        id = try container.decodeIfPresent(String.self, forKey: .id)
        namespace = try container.decodeIfPresent(String.self, forKey: .namespace)
        _self = try container.decodeIfPresent(String.self, forKey: ._self)
        header = try container.decodeIfPresent(MemberHomeFeedCardHeader.self, forKey: .header)
        primaryActions = try container.decodeIfPresent([MemberHomeFeedPrimaryAction].self, forKey: .primaryActions)
        data = try container.decodeIfPresent(MemberHomeFeedCardData.self, forKey: .data)

        guard let templateName = try container.decodeIfPresent(String.self, forKey: .template),
            let templateType = MemberHomeFeedTemplate.init(rawValue: templateName) else {
                template = .unknown
            return
        }
        template = templateType
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CardCodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(namespace, forKey: .namespace)
        try container.encodeIfPresent(_self, forKey: ._self)
        try container.encodeIfPresent(header, forKey: .header)
        try container.encodeIfPresent(primaryActions, forKey: .primaryActions)
        try container.encodeIfPresent(data, forKey: .data)
        try container.encodeIfPresent(template.rawValue, forKey: .template)
    }
}

public struct MemberHomeFeedCardHeader: Codable {
    public var title: String?
    public var contextMenu: MemberHomeFeedContextMenu?
    public var image: MemberHomeFeedImage?
}

public struct MemberHomeFeedContextMenu: Codable {
    public var instrumentation: MemberHomeFeedActionInstrumentation?
    public var actions: [MemberHomeFeedCardContextMenuItem]?
}

public struct MemberHomeFeedCardContextMenuItem: MemberHomeFeedActionable {
    public var text: String?
    public var action: MemberHomeFeedAction?
}

public struct MemberHomeFeedCardData: Codable {
    public var title: String?
    public var description: String?
    public var additionalInfo: String?
    public var inputEntry: String?
    public var metaInfo: String?
    public var image: MemberHomeFeedImage?
    public var action: MemberHomeFeedAction?
    public var datums: [MemberHomeFeedDatum]?
    public var undo: MemberHomeFeedPrimaryAction?
}

public protocol MemberHomeFeedActionable: Codable {
    var text: String? { get set }
    var action: MemberHomeFeedAction? { get set }
}

public struct MemberHomeFeedPrimaryAction: MemberHomeFeedActionable, Identifiable {
    public var id: String
    public var text: String?
    public var action: MemberHomeFeedAction?
}

public struct MemberHomeFeedAction: Equatable, Codable {
    public enum Style: String, Codable {
        case weak, strong
    }

    public var type: String?
    public var verb: String?
    public var url: String?
    public var native: String? // used to deeplink to other part of the app
    public var instrumentation: MemberHomeFeedActionInstrumentation?
    public var style: Style?

    enum CodingKeys: String, CodingKey {
        case type
        case verb
        case url
        case native
        case instrumentation
        case style = "@style"
    }
}

public enum MemberHomeFeedActionType: String {
    case link = "LINK"
    case replace = "REPLACE"
    case back = "BACK"
}

public struct MemberHomeFeedDatum: Codable {
    public var label: String?
    public var value: String?
}

public struct MemberHomeFeedActionInstrumentation: Equatable, Codable {
    public var tapTag: String?
    public var attributes: [String: String]?
}

public struct MemberHomeFeedImage: Codable {
    public var icon: String? // icon name for local asset
    public var description: String?
    public var sizes: [MemberHomeFeedImageSize]?
    public var title: String? // pretty sure this got added as a non nullable property to the backend even though we only need it for the header image.
}

public struct MemberHomeFeedImageSize: Codable {
    public var maxWidth: Int?
    public var maxHeight: Int?
    public var mimeType: String?
    public var url: String?
}
