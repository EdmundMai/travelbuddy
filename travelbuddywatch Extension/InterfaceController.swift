//
//  InterfaceController.swift
//  travelbuddywatch Extension
//
//  Created by Edmund Mai on 12/6/15.
//  Copyright © 2015 Edmund Mai. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

  @IBOutlet var enlargedImage: WKInterfaceImage!
  
  override func awakeWithContext(context: AnyObject?) {
      super.awakeWithContext(context)
      
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
  
  override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
    return segueIdentifier
  }


}
