// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class CoolController: UIViewController
{
    var textField: UITextField!
    var contentView: UIView!
    
    @objc func addCell() {
        print("In \(#function)")
        let newCell = CoolViewCell()
        newCell.text = textField.text
        contentView.addSubview(newCell)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let screenRect = UIScreen.main.bounds
        let (accessoryRect, contentRect) = screenRect.divided(atDistance: 120, from: .minYEdge)
        
        let accessoryView = UIView(frame: accessoryRect)
        contentView = UIView(frame: contentRect)
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        contentView.clipsToBounds = true
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        // Controls
        
        textField = UITextField(frame: CGRect(x: 15, y: 80, width: 240, height: 30))
        accessoryView.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter a label"
        
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 270, dy: 80)
        
        accessoryView.addSubview(button)
        
        button.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        
        // Cells
        
        let subview1 = CoolViewCell(frame: CGRect(x: 20, y: 30, width: 200, height: 40))
        let subview2 = CoolViewCell(frame: CGRect(x: 50, y: 90, width: 200, height: 40))
        contentView.addSubview(subview1)
        contentView.addSubview(subview2)
        
        subview1.text = "Hello World! 🌍🌎🌏"
        subview2.text = "Cool View Cells FTW! 🥂🍾"
        
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
    }
}
