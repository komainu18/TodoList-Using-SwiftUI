//
//  InputTextView.swift
//  KtTodoList
//
//  Created by si ha on 2019/11/20.
//  Copyright © 2019 komainu-ya. All rights reserved.
//

import SwiftUI
import UIKit

struct InputTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var placeholder: String
    @Binding var backgroundColor: UIColor

    func makeUIView(context: UIViewRepresentableContext<InputTextField>) -> UITextField {
        let textField = UITextField()
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<InputTextField>) {
        uiView.text = self.text
        uiView.placeholder = self.placeholder
        uiView.backgroundColor = self.backgroundColor
    }
}
