//
//  ViewController.swift
//  travelbuddy
//
//  Created by Edmund Mai on 11/28/15.
//  Copyright © 2015 Edmund Mai. All rights reserved.
//

import UIKit
import iAd
import CoreLocation

class ViewController: UIViewController, ADBannerViewDelegate {
  
  let locationManager = CLLocationManager()
  
  var languageOfCurrentCountry = "English"
  
  var bannerView: ADBannerView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let locale = NSLocale.currentLocale()
    let countryCode = locale.objectForKey(NSLocaleCountryCode) as! String
    LanguageManager.sharedInstance.setLanguageFor("languageOfDevice", countryCode: countryCode)
    
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    self.canDisplayBannerAds = true
    self.bannerView?.delegate = self
    self.bannerView?.hidden = true
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func largeImageTapped(sender: UITapGestureRecognizer) {
    let enlargedView = sender.view!
    UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveEaseInEaseOut, animations: {
      enlargedView.alpha = 0.0
    }, completion: {
      enlargedView.removeFromSuperview()
    })
  }
  
  func bannerViewDidLoadAd(banner: ADBannerView!) {
    self.bannerView?.hidden = false
  }
  
  func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    self.bannerView?.hidden = true
  }
  
  func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
    return willLeave
  }

}

extension ViewController: CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
    locationManager.stopUpdatingLocation()
    
    let geoCoder = CLGeocoder()
    geoCoder.reverseGeocodeLocation(newLocation, completionHandler: { (placemarks, error) -> Void in
      if error != nil {
        return
      } else {
        let placemark = placemarks![0]
        LanguageManager.sharedInstance.setLanguageFor("languageOfCurrentCountry", countryCode: placemark.ISOcountryCode!)
      }
    })
  }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return iconMapper.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell: IconCell = collectionView.dequeueReusableCellWithReuseIdentifier("icon", forIndexPath: indexPath) as! IconCell
    cell.imageView.image = UIImage(named: iconMapper[indexPath.row]!)
    
    let keyword = iconMapper[indexPath.row]!
    cell.imageLabel.text = LanguageManager.sharedInstance.wordTranslation(keyword)
    
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
    enlargedView.backgroundColor = UIColor(red: (0/255.0), green: (169/255.0), blue: (255/255.0), alpha: 1.0)
    
    let enlargedImageView = UIImageView(frame: CGRectMake(UIScreen.mainScreen().bounds.width*0.1, UIScreen.mainScreen().bounds.height/5, UIScreen.mainScreen().bounds.width*0.8, UIScreen.mainScreen().bounds.height/2))
    enlargedImageView.contentMode = UIViewContentModeScaleAspectFit
    enlargedImageView.image = cell.imageView.image
    
    enlargedView.addSubview(enlargedImageView)
    
    let translationTextLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width*0.1, UIScreen.mainScreen().bounds.height * 4/5.5, UIScreen.mainScreen().bounds.width*0.8, UIScreen.mainScreen().bounds.height/4))
    let keyword = iconMapper[indexPath.row]!
    translationTextLabel.text = LanguageManager.sharedInstance.sentenceTranslation(keyword)
    translationTextLabel.font = UIFont.systemFontOfSize(27)
    translationTextLabel.numberOfLines = 3
    translationTextLabel.textColor = UIColor.whiteColor()

    translationTextLabel.textAlignment = NSTextAlignment.Center
    
    enlargedView.addSubview(translationTextLabel)

    let tap = UITapGestureRecognizer(target: self, action: Selector("largeImageTapped:"))
    enlargedView.addGestureRecognizer(tap)
    
    enlargedView.alpha = 0.0
    self.view.addSubview(enlargedView)
    
    UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveEaseInEaseOut, animations: {
      enlargedView.alpha = 1.0
    }, completion: nil)
  }
}
