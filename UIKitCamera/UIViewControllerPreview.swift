//
// Bolt TSA
//
// Created on 2024-09-17 by Tim Mitra
// Copyright (c) 2024 Circinus.


// Create Preview in UIKit

import SwiftUI

struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ viewController: ViewController) {
        self.viewController = viewController
    }

    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ view: View) {
        self.view = view
    }

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
