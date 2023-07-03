//
//  CALCButtonViewModel.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 27/06/23.
//

import Foundation
import SwiftUI
import ThemeKit

public enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case dot = "."
    case clearText = "Clr"
    case result = "="
    case sum = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case sin = "Sin"
    case cos = "Cos"
    case online = "₿"
    case none = ""
}

extension CalculatorButton {
    public var style: CALCButtonStyle {
        switch self {
        case .result, .sum, .subtract, .multiply, .divide, .sin, .cos, .online:
            return .operation
        default:
            return .numbers
        }
    }
}

public enum CALCButtonStyle {
    case numbers
    case operation
}

public struct CALCButtonTypeStyle {

    public let buttonStyle: CALCButtonStyle
    let font: Font
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    
    public init(buttonStyle: CALCButtonStyle,
                font: Font = .title,
                cornerRadius: CGFloat = 18.0,
                backgroundColor: Color = Theme.currentTheme.numberBackgroundColor,
                foregroundColor: Color = Theme.currentTheme.numberFontColor) {
        self.buttonStyle = buttonStyle
        self.font = font
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
}

public struct CALCButtonViewModel: Identifiable, Hashable {
    
    public static func == (lhs: CALCButtonViewModel, rhs: CALCButtonViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id.uuidString)
       }
    
    public let id = UUID()

    public let style :CALCButtonTypeStyle
    public let type: CalculatorButton
    
    var handleButtonTapAction: (CALCButtonViewModel) -> Void
        
    public var title: String {
        return type.rawValue
    }
    
    public init(style: CALCButtonTypeStyle, type: CalculatorButton, handleButtonTapAction: @escaping (CALCButtonViewModel) -> Void) {
        self.style = style
        self.type = type
        self.handleButtonTapAction = handleButtonTapAction
    }
    
    var isNetworkEnable: Bool {
        return self.type == .online
    }
}
