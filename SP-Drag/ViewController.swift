//
//  ViewController.swift
//  SP-Drag
//
//  Created by Diana Tsarkova on 19.01.2021.
//

import UIKit

class ViewController: UIViewController {

    private var recView = UIView()
    private var centerY: NSLayoutConstraint?
    private var centerX: NSLayoutConstraint?
    private var offSett = CGPoint()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(recView)
        
        recView.backgroundColor = .cyan
        recView.translatesAutoresizingMaskIntoConstraints = false
        centerY = NSLayoutConstraint(item: recView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        centerX = NSLayoutConstraint(item: recView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        recView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        recView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        centerY?.isActive = true
        centerX?.isActive = true
        recView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recView.updateConstraints()
    }
    
    @objc func detectPan(_ recognizer: UIPanGestureRecognizer) {
        view.bringSubviewToFront(recView)
        view.layoutIfNeeded()
        let translation = recognizer.translation(in: view)
        switch recognizer.state {
        case .began:
            offSett = CGPoint(x: centerX?.constant ?? 0, y: centerY?.constant ?? 0)
        case .changed:
            centerX?.constant = offSett.x + translation.x
            centerY?.constant = offSett.y + translation.y
            view.layoutIfNeeded()
        case .ended:
            print("ENDED")
        @unknown default:
            print("DEFAULT")
        }
    }
}

