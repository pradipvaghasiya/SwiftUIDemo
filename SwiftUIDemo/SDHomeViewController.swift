//
//  SDHomeViewController.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI
///Home Controller of SwiftUI Demo Project. It contains different use cases which can be implemented using SwiftUI.
class SDHomeViewController: UIViewController {
   
   var tableData : ListingData = []

   ///As per SPListingTableVC description
   ///
   
   var isVertical : Bool = true
   
   // MARK: ViewController Delegates
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Add Table View Controller using swiftui framework
      self.addTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
      print("didReceiveMemoryWarning")
   }
}

extension SDHomeViewController: SPListingControllerType{
   func listingData(listingView : UIView)->ListingData {
      return tableData
   }
}


//MARK: Add Table View
extension SDHomeViewController{
   func addTableView(){
      
      let spTableView = SPTableView(frame: self.view.frame, style : .Plain)
      self.automaticallyAdjustsScrollViewInsets = false
      spTableView.contentInset = UIEdgeInsets(top: 64,left: 0,bottom: 0,right: 0)
      
      // This is the model we need to show in TableView
      let section0Rows = [
         "Basic TableView",
         "Custom TableView",
         "Fixed Column and Row Vertical",
         "Fixed Column and Row Horizontal",
         "Straight Vertical",
         "Straight Space Optimized Vertical",
         "Auto Resizing Straight Vertical"]
      
      // Assign spListingData to SPTableView
      tableData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: section0Rows)
      spTableView.controller = self
      
      // TableView Delegate
      spTableView.delegate = self
      
      //Add spTableView
      self.view.addSubview(spTableView)
      
   }
}

extension SDHomeViewController : UITableViewDelegate{
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      
      switch(indexPath.row){
      case 0:
         self.performSegueWithIdentifier(kSegueToSDBasicTableVC, sender: self)
      case 2:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDFixedColumnRowVC, sender: self)
      case 3:
         isVertical = false
         self.performSegueWithIdentifier(kSegueToSDFixedColumnRowVC, sender: self)
      case 4:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDColumnOrRowLayoutVC, sender: self)
      case 5:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDColumnBasedSpaceOptimizedVerticalLayoutVC, sender: self)
      case 6:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDStraightAutoSizingVerticalLayoutVC, sender: self)
      default:
         break
      }
   }
   
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == kSegueToSDFixedColumnRowVC{
         if let destination = segue.destinationViewController as? SDFixedColumnRowVC{
            destination.isVertical = isVertical
         }
      }
   }
}


