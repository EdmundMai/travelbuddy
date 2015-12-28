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
    let keyword = iconMapper[index!]!
    
    let enlargedImage = UIImage(named: keyword)
    image.setImage(enlargedImage)
    
    label.setText(LanguageManager.sharedInstance.wordTranslation(keyword))
  }
}
