//
//  View+Extension.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 28/06/23.
//

import Foundation
import SwiftUI

extension View {
    public func toast(data: Binding<CALCBannerViewModel?>, yOffset: CGFloat = 20) -> some View {
        self.modifier(CALCBannerMessageViewModifier(viewModel: data, yOffset: yOffset))
    }
}
