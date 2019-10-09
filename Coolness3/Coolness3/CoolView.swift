// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class CoolView: UIView
{
    @IBOutlet var contentView: UIView!
    @IBOutlet var textField: UITextField!
    
    @IBAction func addCell() {
        print("In \(#function)")
        let newCell = CoolViewCell()
        newCell.text = textField.text
        contentView.addSubview(newCell)
    }
}

extension CoolView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("In \(#function)")
        textField.resignFirstResponder()
        return true
    }
}

