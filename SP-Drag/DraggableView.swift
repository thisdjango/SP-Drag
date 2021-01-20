//
//  DraggableView.swift
//  SP-Drag
//
//  Created by Diana Tsarkova on 20.01.2021.
//

import UIKit

class DraggableView: UIView {
    var centerY: NSLayoutConstraint?
    var centerX: NSLayoutConstraint?
    var offSett = CGPoint()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))
    }
    
    func layoutConstraint() {
        translatesAutoresizingMaskIntoConstraints = false
        centerY = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superview, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        centerX = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        widthAnchor.constraint(equalToConstant: 60).isActive = true
        centerY?.isActive = true
        centerX?.isActive = true
    }
    
    @objc func detectPan(_ recognizer: UIPanGestureRecognizer) {
        superview?.bringSubviewToFront(self)
        superview?.layoutIfNeeded()
        let translation = recognizer.translation(in: superview)
        switch recognizer.state {
        case .began:
            offSett = CGPoint(x: centerX?.constant ?? 0, y: centerY?.constant ?? 0)
        case .changed:
            centerX?.constant = offSett.x + translation.x
            centerY?.constant = offSett.y + translation.y
            superview?.layoutIfNeeded()
        case .ended:
            print("ENDED")
        @unknown default:
            print("DEFAULT")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
