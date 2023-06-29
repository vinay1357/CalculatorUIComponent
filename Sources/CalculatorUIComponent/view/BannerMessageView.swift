//
//  BannerMessageView.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 28/06/23.
//
import SwiftUI

public struct BannerMessageView: View {

    @ObservedObject var viewModel: CALCBannerViewModel
    public init(viewModel: CALCBannerViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.title)
                        .foregroundColor(viewModel.type.fontColor)
                        .font(viewModel.type.fontTitle)
                    if let message = (viewModel.message) {
                        Text(message)
                            .foregroundColor(viewModel.type.fontColor)
                            .font(viewModel.type.fontDescription)
                    }
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.87)
            .padding(9)
            .padding(.top, 20)
            .background(.clear)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(viewModel.type.borderColor, lineWidth: 1)
            )
            Spacer()
        }
    }
}
