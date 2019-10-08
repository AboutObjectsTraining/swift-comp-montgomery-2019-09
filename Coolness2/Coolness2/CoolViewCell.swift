// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

private let textInsets = UIEdgeInsets(top: 7, left: 12, bottom: 8, right: 12)
private let textOrigin = CGPoint(x: textInsets.left, y: textInsets.top)

private let defaultTextAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.boldSystemFont(ofSize: 20),
    .foregroundColor: UIColor.white
]

@IBDesignable
class CoolViewCell: UIView
{
    @IBInspectable var text: String? {
        didSet { sizeToFit() }
    }
    
    var highlighted: Bool = false {
        didSet { alpha = highlighted ? 0.5 : 1.0 }
    }
    
    class var textAttributes: [NSAttributedString.Key: Any] {
        return defaultTextAttributes
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizers()
    }
    
    // FIXME: Potential crasher
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayer()
        configureGestureRecognizers()
    }

    private func configureLayer() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func configureGestureRecognizers() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
}

// MARK: - Animation

extension CoolViewCell
{
    @objc func bounce() {
        print("In \(#function)")
        animateBounce(duration: 1, size: CGSize(width: 120, height: 240))
    }
    
    private func configureBounce(size: CGSize) {
        UIView.setAnimationRepeatCount(3)
        UIView.setAnimationRepeatAutoreverses(true)
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        self.transform = translation.rotated(by: .pi / 2)
    }
    
    func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in self?.configureBounce(size: size) },
                       completion: { [weak self] (_) in self?.transform = .identity })
    }
}

// MARK: - Drawing and resizing

extension CoolViewCell
{
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        var newSize = (text as NSString).size(withAttributes: type(of: self).textAttributes)
        newSize.width += textInsets.left + textInsets.right
        newSize.height += textInsets.top + textInsets.bottom
        return newSize
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: textOrigin, withAttributes: type(of: self).textAttributes)
    }
}

// MARK: - UIResponder methods
extension CoolViewCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubviewToFront(self)
        highlighted = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let currLocation = touch.location(in: nil)
        let prevLocation = touch.previousLocation(in: nil)
        frame.origin.x += currLocation.x - prevLocation.x
        frame.origin.y += currLocation.y - prevLocation.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
}
