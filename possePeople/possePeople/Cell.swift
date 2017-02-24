//
//  Cell.swift
//  possePeople
//
//  Created by Ehsan Zaman on 2/20/17.
//  Copyright © 2017 Ehsan Zaman. All rights reserved.
//

import Foundation
import UIKit


class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.draw(frame)
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.frame.size.width =  frame.width * 0.9
        //called here because frame is called when collection view dequeues a cell
        setupViews()
    }
    
    
    let faveColor: UILabel = {
        let label = UILabel()
        label.text = "text"
        label.font =  UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "text"
        label.font =  UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "text"
        label.font =  UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.font =  UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var pic: UIImageView = {
        let picture = UIImageView()
        picture.image  = #imageLiteral(resourceName: "posse-logo")
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.layer.cornerRadius = 8
        picture.layer.masksToBounds = true
        
        return picture
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        //label.text = "Text"
        label.font =  UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func setupViews() {
        backgroundColor = .gray
        addSubview(pic)
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(faveColor)
        addSubview(weightLabel)
        addSubview(numberLabel)
        
        
        let views = Dictionary(dictionaryLiteral: ("pic",pic),("nameLabel", nameLabel),("ageLabel",ageLabel),("faveColor",faveColor), ("weightLabel", weightLabel), ("numberLabel", numberLabel))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[pic(100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[pic(100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[nameLabel(16)][ageLabel(16)][faveColor(16)][numberLabel(16)][weightLabel(16)]-40-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pic]-10-[nameLabel]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pic]-10-[ageLabel]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pic]-10-[faveColor]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pic]-10-[weightLabel]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pic]-10-[numberLabel]|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

