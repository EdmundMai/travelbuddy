//
//  ViewController.swift
//  travelbuddy
//
//  Created by Edmund Mai on 11/28/15.
//  Copyright © 2015 Edmund Mai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let iconMapper = [1: "toilet", 2: "food", 3: "medicine"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func smallImageTapped(sender: AnyObject) {
    let smallButton = sender as! UIButton

    let button = UIButton(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//    button.setTitle("heyyyy", forState: .Normal)
    button.backgroundColor = UIColor(red: 0, green: 111, blue: 234, alpha: 1.0)
    
    let image = UIImage(named: iconMapper[smallButton.tag]!)
    button.setImage(image, forState: .Normal)
    
    let tap = UITapGestureRecognizer(target: self, action: Selector("largeImageTapped:"))
    button.addGestureRecognizer(tap)
    
    button.alpha = 0.0
    self.view.addSubview(button)
    UIView.beginAnimations(nil, context: nil)
    button.alpha = 1.0
    UIView.commitAnimations()
  }

  func largeImageTapped(sender: UITapGestureRecognizer) {
    let button = sender.view! as! UIButton
    UIView.beginAnimations(nil, context: nil)
    button.alpha = 0.0
    UIView.commitAnimations()
    button.removeFromSuperview()
  }

}

