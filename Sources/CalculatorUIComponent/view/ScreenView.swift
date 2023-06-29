//
//  SwiftUIView.swift
//  
//
//  Created by vinay kamra on 29/06/23.
//

import SwiftUI

public struct ScreenView: View {
    @ObservedObject var viewModel: CALCScreenViewModel
    public var body: some View {
        Text(viewModel.screenText)
            .bold()
            .font(viewModel.style.font)
            .foregroundColor(viewModel.style.foregroundColor)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    public init(viewModel: CALCScreenViewModel) {
        self.viewModel = viewModel
    }
    
}
