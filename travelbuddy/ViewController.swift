//
//  ViewController.swift
//  travelbuddy
//
//  Created by Edmund Mai on 11/28/15.
//  Copyright © 2015 Edmund Mai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let iconMapper = [
    0: "toilet-1",
    1: "atm-machine",
    2: "food",
    3: "charger-1",
    4: "subway",
    5: "cafe",
    6: "airport",
    7: "taxi",
    8: "wifi"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func largeImageTapped(sender: UITapGestureRecognizer) {
    let enlargedView = sender.view!
    UIView.beginAnimations(nil, context: nil)
    enlargedView.alpha = 0.0
    UIView.commitAnimations()
    enlargedView.removeFromSuperview()
  }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return iconMapper.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell: IconCell = collectionView.dequeueReusableCellWithReuseIdentifier("icon", forIndexPath: indexPath) as! IconCell
    print(indexPath.row)
    cell.imageView.image = UIImage(named: iconMapper[indexPath.row]!)
    
    return cell
    
  }
  
  func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    let cell: IconCell = collectionView.cellForItemAtIndexPath(indexPath) as! IconCell
    
    cell.imageView.alpha = 0.5
    return true
  }
  
  func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
    let cell: IconCell = collectionView.cellForItemAtIndexPath(indexPath) as! IconCell
    cell.imageView.alpha = 1.0
  }
  
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let cell: IconCell = collectionView.cellForItemAtIndexPath(indexPath) as! IconCell
    
    let enlargedView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
    enlargedView.backgroundColor = UIColor(red: 0, green: 111, blue: 234, alpha: 1.0)
    
    
    let enlargedImageView = UIImageView(frame: CGRectMake(UIScreen.mainScreen().bounds.width*0.1, UIScreen.mainScreen().bounds.height/4, UIScreen.mainScreen().bounds.width*0.8, UIScreen.mainScreen().bounds.height/2))
    enlargedImageView.image = cell.imageView.image
    
    enlargedView.addSubview(enlargedImageView)
    

    let tap = UITapGestureRecognizer(target: self, action: Selector("largeImageTapped:"))
    enlargedView.addGestureRecognizer(tap)
    
    enlargedView.alpha = 0.0
    self.view.addSubview(enlargedView)
    UIView.beginAnimations(nil, context: nil)
    enlargedView.alpha = 1.0
    UIView.commitAnimations()
//
//    let button = UIButton(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//    //    button.setTitle("heyyyy", forState: .Normal)
//    button.backgroundColor = UIColor(red: 0, green: 111, blue: 234, alpha: 1.0)
//    button.setImage(cell.imageView.image, forState: .Normal)
//    
//    let tap = UITapGestureRecognizer(target: self, action: Selector("largeImageTapped:"))
//    button.addGestureRecognizer(tap)
//    
//    button.alpha = 0.0
//    self.view.addSubview(button)
//    UIView.beginAnimations(nil, context: nil)
//    button.alpha = 1.0
//    UIView.commitAnimations()
  }
}