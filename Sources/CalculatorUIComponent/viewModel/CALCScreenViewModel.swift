//
//  File.swift
//  
//
//  Created by vinay kamra on 29/06/23.
//

import Foundation
import SwiftUI
import ThemeKit

public struct CALCScreenViewStyle {
    let font: Font
    let foregroundColor: Color
    
    public init(font: Font = .system(size: 50),
                foregroundColor: Color = Theme.currentTheme.screenTextColor) {
        self.font = font
        self.foregroundColor = foregroundColor
    }
}

public class CALCScreenViewModel : ObservableObject {
    
    @Published public var screenText: String
    
    
    let style: CALCScreenViewStyle
    
    public init(screenText: String, style:CALCScreenViewStyle = CALCScreenViewStyle()) {
        self.screenText = screenText
        self.style = style
    }
}
