//
//  BannerViewModel.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 28/06/23.
//

import Foundation
import SwiftUI
import ThemeKit

public final class CALCBannerViewModel: ObservableObject, Equatable {

    public static func == (lhs: CALCBannerViewModel, rhs: CALCBannerViewModel) -> Bool {
        lhs.title == rhs.title
    }

    public init(title: String,
                message: String? = nil,
                type: CALCBannerType) {
        self.title = title
        self.message = message
        self.type = type
    }

    var title: String
    var message: String?
    public var type: CALCBannerType
}

public enum CALCBannerType {
    case success
    case error

    var tintColor: Color {
        switch self {
        case .success:
            return Theme.currentTheme.success
        case .error:
            return Theme.currentTheme.error
        }
    }
    var borderColor: Color {
        switch self {
        case .success:
            return Theme.currentTheme.success
        case .error:
            return Theme.currentTheme.error
        }
    }

    var image: String {
        switch self {
        case .success:
            return "success"
        case .error:
            return "error"
        }
    }

    var fontColor: Color {
        switch self {
        case .success:
            return Theme.currentTheme.success
        case .error:
            return Theme.currentTheme.error
        }
    }

    var fontTitle: Font {
        return Font.title
    }

    var fontDescription: Font {
        return Font.title2
    }
}
