//
//  MemberHomeFeedTemplate.swift
//  Member
//
//  Created by Michael Mecham on 8/16/19.
//  Copyright © 2019 SoFi. All rights reserved.
//

import UIKit

/// A view that can be presented as an injected view on the Member Home Feed.
/// These views typically are injected into the hostedView of FeedMasterCardTableViewCell
public protocol MemberHomeFeedTemplateViewProtocol: UIView, CancelableTemplateView {

    /// Populates the template with the corresponding data
    /// - Parameter data: The data to use to populate the templates various subviews
    func configure(with data: MemberHomeFeedCardData?)
}

public protocol CancelableTemplateView {
    func cancelPendingRequestsIfNeeded()
}


/// The template views available for use on the Member Home Feed.
/// Each individual case is created depending on the string that comes from the backend for the template type
///
/// - dualTextImage: Contains a title, description, and trailing side image
/// - dualTextLargeImage: Contains a large image on top, a title, and a description
/// - dualText: Contains a title and a description
/// - unknown: For any template types that we receive but do not currently have handled.
public enum MemberHomeFeedTemplate: String {

    @available(*, deprecated, message: "This template has been deprecated, please use smallImageA instead")
    case dualTextImage = "DUAL_TEXT_IMAGE"

    @available(*, deprecated, message: "This template has been deprecated, please use largeImageA instead")
    case dualTextLargeImage = "DUAL_TEXT_LARGE_IMAGE"

    @available(*, deprecated, message: "This template has been deprecated, please use textA instead")
    case dualText = "DUAL_TEXT"

    @available(*, deprecated, message: "This template has been deprecated, please use largeImageB instead")
    case tripleTextLargeImage = "TRIPLE_TEXT_LARGE_IMAGE"

    @available(*, deprecated, message: "This template has been deprecated, please use largeImageC instead")
    case dualTextMetaLargeImage = "DUAL_TEXT_META_LARGE_IMAGE"

    @available(*, deprecated, message: "This template has been deprecated, please use largeImageA instead")
    case dualTextTripleDatum = "DUAL_TEXT_TRIPLE_DATUM"

    case smallImageA = "SMALL_IMAGE_A"
    case largeImageA = "LARGE_IMAGE_A"
    case largeImageB = "LARGE_IMAGE_B"
    case largeImageC = "LARGE_IMAGE_C"
    case textA = "TEXT_A"
    case datumsA = "DATUMS_A"


    case feedback = "FEEDBACK_CARD"
    case hide = "HIDDEN_CARD"
    case unknown
}

// This is intentionally marked as internal.
// This is to be used specifically with the MHF text based templates.
internal extension String {

    /// Sets the correct praragraph stlye for the text based templates that span multiple lines.
    ///
    /// - Returns: Attributed string with the correct line spacing
    func textTemplateParagraphStyle() -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString.init(string: self)
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
}

protocol MemberHomeFeedInputAction: NSObjectProtocol {
    var delegate: MemberHomeFeedInputActionDelegate? { get set }
}

protocol MemberHomeFeedInputActionDelegate: AnyObject {
    func textDidChange(_ text: String?)
}

protocol MemberHomeFeedCTA: NSObjectProtocol {
    var delegate: MemberHomeFeedCTADelegate? { get set }
}

protocol MemberHomeFeedCTADelegate: AnyObject {
    func buttonPressed(In template: MemberHomeFeedTemplate)
}
