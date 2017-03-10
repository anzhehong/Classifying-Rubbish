//
//  RubbishView.swift
//  Swift Tips Learn
//
//  Created by An, Fowafolo on 3/10/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

public protocol RubbishViewDelegate {
    func getFinalPoint(targetView: RubbishView)
}

public class RubbishView: UIView {
    
    private var imageView: UIImageView!
    var delegate: RubbishViewDelegate!
    public var rubbish: Rubbish!
    
    init(frame: CGRect, theRubbish: Rubbish) {
        super.init(frame: frame)
        rubbish = theRubbish
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var startPoint = CGPoint()
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startPoint = (touches.first?.location(in: self))!
        self.superview?.bringSubview(toFront: self)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let crtPoint = (touches.first?.location(in: self))!
        let deltX = crtPoint.x - startPoint.x
        let deltY = crtPoint.y - startPoint.y
        self.center = CGPoint(x: self.center.x + deltX, y: self.center.y + deltY)
        super.touchesMoved(touches, with: event)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate.getFinalPoint(targetView: self)
    }
    
    func setupView() {
        imageView = UIImageView(image: rubbish.image)
        addSubview(imageView)
        CRUtils.addAllAroundConstraints(imageView, containerView: self)
    }
}
