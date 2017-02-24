//
//  ViewController.swift
//  possePeople
//
//  Created by Ehsan Zaman on 2/18/2017.
//  Copyright © 2017 Ehsan Zaman. All rights reserved.
//

import UIKit
import SwiftyJSON



class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = "customCellID"
    var employeeProfiles = [Programmer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backview = UIView()
        backview.contentMode = UIViewContentMode.scaleAspectFill
        backview.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        collectionView?.backgroundView = backview
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellIdentifier)
       employeeProfiles = datastore.sharedInstance.parseFile(array: employeeProfiles)
     
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        customCell.pic.image = employeeProfiles[indexPath.item].picture.image
        customCell.nameLabel.text = employeeProfiles[indexPath.item].name
        customCell.ageLabel.text = "Age: \(employeeProfiles[indexPath.item].age)"
        customCell.faveColor.text = "Favorite color: \(employeeProfiles[indexPath.item].favoriteColor)"
        customCell.weightLabel.text = "Weight: \(employeeProfiles[indexPath.item].weight)"
        customCell.numberLabel.text = "Number: \(employeeProfiles[indexPath.item].phone)"
        
        return customCell
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employeeProfiles.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 160)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 1, animations:
            {
                cell?.transform = CGAffineTransform(scaleX: 0.9,y: 0.9)
            },
                       completion: { finished in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 1, animations: {
                cell?.transform = CGAffineTransform(scaleX: 1,y: 1)
            })
        }
        
        )
      
    }
    
}


