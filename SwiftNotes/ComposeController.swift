//
//  ComposeController.swift
//  SwiftNotes
//
//  Created by Tri Vuong on 3/20/19.
//  Copyright © 2019 Tri Vuong. All rights reserved.
//

import Foundation
import UIKit

class ComposeController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Compose"
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let textField = UITextView(frame: CGRect(x: 0, y: 88, width: screenWidth, height: screenHeight - 88))
        textField.isEditable = true
        textField.isScrollEnabled = true
        textField.backgroundColor = UIColor.white
        textField.delegate = self
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.autocorrectionType = .no
        self.view.addSubview(textField)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let body = CreateNoteInput(body: textView.text)
        apollo.perform(mutation: CreateNoteMutation(input: body))
    }
}
