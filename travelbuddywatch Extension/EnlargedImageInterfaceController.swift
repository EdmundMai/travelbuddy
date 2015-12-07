//
//  EnlargedImageInterfaceController.swift
//  travelbuddy
//
//  Created by Edmund Mai on 12/6/15.
//  Copyright © 2015 Edmund Mai. All rights reserved.
//

import WatchKit
import Foundation


class EnlargedImageInterfaceController: WKInterfaceController {

  @IBOutlet var image: WKInterfaceImage!
  @IBOutlet var label: WKInterfaceLabel!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    let index = Int(context as! String)
    let imageName = iconMapper[index!]!
    
    let enlargedImage = UIImage(named: imageName)
  
    image.setImage(enlargedImage)
    label.setText(imageName)
      
      // Configure interface objects here.
  }

  override func willActivate() {
      // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  override func didDeactivate() {
      // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }

}
