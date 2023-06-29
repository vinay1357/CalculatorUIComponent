//
//  CALCBannerMessageViewModifier.swift
//  Assignment_Calculator
//
//  Created by vinay kamra on 28/06/23.
//

import Foundation

import SwiftUI

public struct CALCBannerMessageViewModifier: ViewModifier {

    let yOffset: CGFloat
    public init(viewModel: Binding<CALCBannerViewModel?>, yOffset: CGFloat = 10) {
        self.yOffset = yOffset
        self._viewModel = viewModel
    }

    @Binding var viewModel: CALCBannerViewModel?
    @State private var workItem: DispatchWorkItem?

    public func body(content: Content) -> some View {
        ZStack {
            content
            if let viewModel = viewModel {
                BannerMessageView(viewModel: viewModel)
                    .offset(y: yOffset)
                    .animation(.spring(), value: viewModel)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onTapGesture(perform: dismissBanner)
                    .onChange(of: viewModel) { value in
                        showBanner()
                    }
                    .onAppear(perform: showBanner)
            }
        }
    }

    private func showBanner() {
        workItem?.cancel()
        let task = DispatchWorkItem {
            dismissBanner()
        }
        workItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: task)
    }

    private func dismissBanner() {
        withAnimation {
            viewModel = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}
