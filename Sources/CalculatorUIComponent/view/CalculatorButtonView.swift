//
//  CalculatorButtonView.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 27/06/23.
//

import SwiftUI

public struct CalculatorButtonView: View {
    let viewModel: CALCButtonViewModel
    
    public init(viewModel: CALCButtonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Button(action: {
            viewModel.handleButtonTapAction(viewModel)
        }, label: {
            Text(viewModel.title)
                .font(viewModel.style.font)
                .frame(width: viewModel.style.width, height: viewModel.style.width)
                .background(viewModel.style.backgroundColor)
                .foregroundColor(viewModel.style.foregroundColor)
                .cornerRadius(viewModel.style.cornerRadius)
        })
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(viewModel: CALCButtonViewModel(style: .init(buttonStyle: .operation), type: .sum
                                                            , handleButtonTapAction: {_ in }))
    }
}
