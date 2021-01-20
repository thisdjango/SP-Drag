//
//  ViewController.swift
//  SP-Drag
//
//  Created by Diana Tsarkova on 19.01.2021.
//

import UIKit

class ViewController: UIViewController {

    private var recView = DraggableView()
    private var secView = DraggableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(recView)
        view.addSubview(secView)
        
        recView.backgroundColor = .cyan
        recView.layoutConstraint()
        secView.backgroundColor = .green
        secView.layoutConstraint()
    }
}

