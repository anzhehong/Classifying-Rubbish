//
//  WelcomeViewController.swift
//  Swift Tips Learn
//
//  Created by An, Fowafolo on 3/7/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

public class WelcomeViewController: UIViewController, BagViewDelegate, RubbishViewDelegate {
    
    let plasiticTrash = TrashView(.zero, category: .plastic)
    let metalTrash = TrashView(.zero, category: .metal)
    let paperTrash = TrashView(.zero, category: .paper)
    let poisonousTrash = TrashView(.zero, category: .poisonous)
    let othersTrash = TrashView(.zero, category: .others)
    var trashViews = [TrashView]()
    
    let catView = UIView(frame: .zero)
    let rubbishBag = BagView(frame: .zero)
    
    var trashContainerView: UIView!
    var backgroundImageView: UIImageView!
    
    public var unassortedRubbish: [Rubbish]!
    var score = 0
    
    convenience public init(bags unassortedCollection: [Rubbish]) {
        self.init(nibName: nil, bundle: nil)
        unassortedRubbish = unassortedCollection
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        backgroundImageView = UIImageView(image: UIImage(named: "streetBackground"))
        backgroundImageView.isUserInteractionEnabled = true
        trashContainerView = UIView(frame: .zero)
        view.addSubview(backgroundImageView)
        
        backgroundImageView.addSubview(trashContainerView)
        backgroundImageView.addSubview(rubbishBag)
        rubbishBag.delegate = self
        
        trashContainerView.addSubview(plasiticTrash)
        trashContainerView.addSubview(metalTrash)
        trashContainerView.addSubview(paperTrash)
        trashContainerView.addSubview(poisonousTrash)
        trashContainerView.addSubview(othersTrash)
        trashViews.append(plasiticTrash)
        trashViews.append(metalTrash)
        trashViews.append(paperTrash)
        trashViews.append(poisonousTrash)
        trashViews.append(othersTrash)
        
        backgroundImageView.addSubview(catView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        // trash container
        CRUtils.addAllAroundConstraints(backgroundImageView, containerView: view)
        trashContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let containerTop = NSLayoutConstraint(item: trashContainerView,
                                              attribute: .top,
                                              relatedBy: .greaterThanOrEqual,
                                              toItem: backgroundImageView,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 80)
        let containerBottom = NSLayoutConstraint(item: trashContainerView,
                                                 attribute: .bottom,
                                                 relatedBy: .equal,
                                                 toItem: backgroundImageView,
                                                 attribute: .bottom,
                                                 multiplier: 1.0,
                                                 constant: 0)
        let containerLeading = NSLayoutConstraint(item: trashContainerView,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: backgroundImageView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let containerTrailing = NSLayoutConstraint(item: trashContainerView,
                                                   attribute: .trailing,
                                                   relatedBy: .greaterThanOrEqual,
                                                   toItem: backgroundImageView,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 30)
        containerTrailing.priority = 750
        backgroundImageView.addConstraints([containerTop, containerBottom, containerLeading, containerTrailing])
        trashContainerView.addConstraint(NSLayoutConstraint(item: trashContainerView,
                                                            attribute: .width,
                                                            relatedBy: .greaterThanOrEqual,
                                                            toItem: trashContainerView,
                                                            attribute: .height, multiplier: 1.0, constant: 100))
        
        // 5 trashes
        plasiticTrash.translatesAutoresizingMaskIntoConstraints = false
        metalTrash.translatesAutoresizingMaskIntoConstraints = false
        paperTrash.translatesAutoresizingMaskIntoConstraints = false
        poisonousTrash.translatesAutoresizingMaskIntoConstraints = false
        othersTrash.translatesAutoresizingMaskIntoConstraints = false
        
        let trashes = [
            "plastic": plasiticTrash,
            "metal": metalTrash,
            "paper": paperTrash,
            "poisonous": poisonousTrash,
            "others": othersTrash
        ]
        
        CRUtils.addTopAndBottomConstraints(plasiticTrash, containerView: trashContainerView)
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[plastic]-5-[metal(==plastic)]-5-[paper(==plastic)]-5-[poisonous(==plastic)]-5-[others(==plastic)]-10-|",
                                                         options: [.alignAllBottom, .alignAllTop],
                                                         metrics: nil,
                                                         views: trashes)
        trashContainerView.addConstraints(constraints)
        
        // Rubbish bag
        
        catView.translatesAutoresizingMaskIntoConstraints = false
        rubbishBag.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingAlign = NSLayoutConstraint(item: catView,
                                               attribute: .trailing,
                                               relatedBy: .equal,
                                               toItem: rubbishBag,
                                               attribute: .trailing,
                                               multiplier: 1.0,
                                               constant: 0)
        let heightEqual = NSLayoutConstraint(item: catView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: rubbishBag,
                                             attribute: .height,
                                             multiplier: 1.0,
                                             constant: 0)
        let topBottom = NSLayoutConstraint(item: catView,
                                           attribute: .bottom,
                                           relatedBy: .equal,
                                           toItem: rubbishBag,
                                           attribute: .top,
                                           multiplier: 1.0,
                                           constant: 0)
        let catTrailing = NSLayoutConstraint(item: catView,
                                             attribute: .trailing,
                                             relatedBy: .equal,
                                             toItem: backgroundImageView,
                                             attribute: .trailing,
                                             multiplier: 1.0,
                                             constant: 0)
        let catLeading = NSLayoutConstraint(item: catView,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: rubbishBag,
                                            attribute: .leading,
                                            multiplier: 1.0,
                                            constant: 0)
        let catTop = NSLayoutConstraint(item: catView,
                                        attribute: .top,
                                        relatedBy: .equal,
                                        toItem: backgroundImageView,
                                        attribute: .centerY,
                                        multiplier: 1.0,
                                        constant: 0)
        let bagBottom = NSLayoutConstraint(item: rubbishBag,
                                           attribute: .bottom,
                                           relatedBy: .equal,
                                           toItem: backgroundImageView,
                                           attribute: .bottom,
                                           multiplier: 1.0,
                                           constant: 0)
        let bagLeading = NSLayoutConstraint(item: rubbishBag,
                                            attribute: .leading,
                                            relatedBy: .greaterThanOrEqual,
                                            toItem: trashContainerView,
                                            attribute: .trailing,
                                            multiplier: 1.0,
                                            constant: 80)
        let bagWidth = NSLayoutConstraint(item: rubbishBag,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: rubbishBag,
                                          attribute: .height,
                                          multiplier: 1.0,
                                          constant: 0)
        
        backgroundImageView.addConstraints([trailingAlign, heightEqual, topBottom, catTrailing, catLeading, catTop, bagBottom, bagLeading, bagWidth])
    }
    
    // MARK: BagViewDelegate
    public func tapBag() {
        print("tap the bag")
        CRUtils.shakeView(rubbishBag)
        
        if let rubbish = unassortedRubbish.first {
            var frame = rubbishBag.frame
            frame.origin = CGPoint(x: frame.origin.x + frame.width / 4, y: frame.origin.y)
            frame.size = CGSize(width: frame.width / 2, height: frame.height / 2)
            let temp = RubbishView(frame: frame, theRubbish: rubbish)
            backgroundImageView.addSubview(temp)
            temp.delegate = self
            
            self.unassortedRubbish.remove(at: 0)
            CRUtils.showSpringAnim(view: temp)
        } else {
            let alert = UIAlertController(title: "Game Over", message: "You have assorted all of the rubbish! Click OK to view your score!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.showScoreAlert()
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(ok)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: Utils
    func showScoreAlert() {
        let alert = UIAlertController(title: "Score", message: "You final score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Great", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - RubbishViewDelegate
    public func getFinalPoint(targetView: RubbishView) {
        
        for item in trashViews {
            let targetFrame = targetView.convert(targetView.bounds, to: backgroundImageView)
            let itemFrame = item.convert(item.bounds, to: backgroundImageView)
            if itemFrame.contains(targetFrame) {
                print("OKOK")
                if item.category == targetView.rubbish.category {
                    showAlert(title: "Congratulations", message: "You have successfully classified \(targetView.rubbish.name)! It belongs to \(targetView.rubbish.category) trash!")
                    score += 1
                } else {
                    showAlert(title: "Pity", message: "\(targetView.rubbish.name) does not belong to \(item.category) trash!")
                    score = max(0, score-1)
                }
                UIView.animate(withDuration: 1.5, animations: {
                    targetView.removeFromSuperview()
                })
            }
        }
    }
}
