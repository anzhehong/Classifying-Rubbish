//
//  BagView.swift
//  Swift Tips Learn
//
//  Created by An, Fowafolo on 3/8/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

public protocol BagViewDelegate {
    func tapBag()
}

public class BagView: UIView {
    
    private let defaultFontSize: CGFloat = 18
    private let backgroundImage = UIImage(named: "bag")
    private var imageView: UIImageView!
    public var delegate: BagViewDelegate!
    private var bagLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        imageView = UIImageView(image: backgroundImage)
        imageView.isUserInteractionEnabled = true
        addSubview(imageView)
        CRUtils.addAllAroundConstraints(imageView, containerView: self)
        
        bagLabel = UILabel()
        bagLabel.backgroundColor = UIColor.white
        bagLabel.textColor = UIColor.black
        bagLabel.font = UIFont.boldSystemFont(ofSize: defaultFontSize)
        bagLabel.text = "Unassorted"
        bagLabel.textAlignment = .center
        
        imageView.addSubview(bagLabel)
        CRUtils.addAllCenterConstraints(bagLabel, containerView: imageView)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    func singleTap() {
        delegate.tapBag()
    }
}
