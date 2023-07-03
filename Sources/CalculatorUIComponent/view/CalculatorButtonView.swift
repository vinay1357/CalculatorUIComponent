//
//  CalculatorButtonView.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 27/06/23.
//

import SwiftUI

public struct CalculatorButtonView: View {
    let viewModel: CALCButtonViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    public init(viewModel: CALCButtonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Button(action: {
            viewModel.handleButtonTapAction(viewModel)
        }, label: {
            Text(viewModel.title)
                .font(viewModel.style.font)
                .frame(width: self.width, height: self.height)
                .frame(maxHeight: .infinity)
                .background(viewModel.style.backgroundColor)
                .foregroundColor(viewModel.style.foregroundColor)
                .cornerRadius(viewModel.style.cornerRadius)
        })
    }
    
    var width: CGFloat {
        
        let useWidth =  UIScreen.main.bounds.width < UIScreen.main.bounds.height
        let side = useWidth ? UIScreen.main.bounds.width : UIScreen.main.bounds.height - 100
        
        let factor =  verticalSizeClass == .regular && horizontalSizeClass == .compact  ? 4.0 : 5.0
        return (side - (factor * 12.0)) / factor
    }
    
    var height: CGFloat {
        return self.width
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(viewModel: CALCButtonViewModel(style: .init(buttonStyle: .operation), type: .sum
                                                            , handleButtonTapAction: {_ in }))
    }
}
