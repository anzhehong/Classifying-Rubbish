//
//  TrashView.swift
//  Swift Tips Learn
//
//  Created by An, Fowafolo on 3/7/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

public class TrashView: UIView {
    
    private let defaultFontSize: CGFloat = 18
    private let backgroundImage = UIImage(named: "trash")
    private var imageView: UIImageView!
    private var trashLabel: UILabel!
    
    private var labelString = ""
    public var category: RubbishCategory = .others {
        didSet {
            switch category {
            case .others:
                labelString = "Others"
                break
            case .plastic:
                labelString = "Plastics"
                break
            case .metal:
                labelString = "Metal"
                break
            case .paper:
                labelString = "Paper"
                break
            case .poisonous:
                labelString = "Poisonous"
            }
        }
    }
    
    //private let backgroundv
    init(_ frame: CGRect, category trashCategory: RubbishCategory) {
        super.init(frame: frame)
        
        setCategory(newCategory: trashCategory)
        setupView()
    }
    
    func setCategory(newCategory: RubbishCategory) {
        category = newCategory
    }
    
    func setupView() {
        self.backgroundColor = UIColor.clear
        
        trashLabel = UILabel()
        trashLabel.backgroundColor = UIColor.white
        trashLabel.textColor = UIColor.black
        trashLabel.font = UIFont.boldSystemFont(ofSize: defaultFontSize)
        trashLabel.text = labelString
        trashLabel.textAlignment = .center
        
        imageView = UIImageView(frame: self.frame)
        imageView.image = backgroundImage
        
        imageView.addSubview(trashLabel)
        addSubview(imageView)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        CRUtils.addAllAroundConstraints(imageView, containerView: self)
        
        CRUtils.addAllCenterConstraints(trashLabel, containerView: imageView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
