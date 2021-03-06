//
//  SDBasicTableVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 15/04/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

///Storyboard Segue id for segue to this controller
let kSegueToSDBasicTableVC = "Show SDBasicTableVC"

// Different Cell Type including prototype cell and by code
//private let kHeaderNFooterTestCaseString = "Header & Footer"
//private let kMultipleSectionsTestCaseString = "Multiple Sections"
//private let kDifferentCellGroupsTestCaseString = "Different Cell Data Set in a Section"  // Tracking callback event from cell or didSelect would be crucial
//private let kVariableRowHeightsTestCaseString = "Automatic Variable Row heights"
//private let kTableViewFooterTestCaseString = "Footer using tableView Property"
private let kCellTypes = "Different Cells"
private let kRuntimeChangesTestCaseString = "Runtime changes in Listing Data"  // Check performance, ease of use.
private let kExcessiveRowsTestCaseString = "100,000 Rows"   // Check Performance Memory uti, CPU util.
private let kTableViewDifferentFrameTestCaseString = "Different Table View Frame"  // Check performance, ease of use.
private let kEdtingTableTestCaseString = "Editing TableView"
private let kNoDataTestCaseString = "No Listing Data"
private let kNoDelegateTestCaseString = "No delegate"
private let kUnregisteredNibAddedTestCaseString = "Unregistered nib added"
private let kGroupedTableViewTestCaseString = "Grouped TableView"


class SDBasicTableVC: UIViewController {

   var tableData : ListingData = []
   
   // List of Test Cases
   private var testCases = [
      kCellTypes,
      kRuntimeChangesTestCaseString,
      kExcessiveRowsTestCaseString,
      kTableViewDifferentFrameTestCaseString,
      kEdtingTableTestCaseString,
      kNoDataTestCaseString,
      kNoDelegateTestCaseString,
      kUnregisteredNibAddedTestCaseString,
      kGroupedTableViewTestCaseString]
   
}

// MARK: ViewController Delegate
extension SDBasicTableVC{
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Add TableView using SwiftUI
      self.addBasicTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
}

extension SDBasicTableVC: SPListingControllerType{
   func listingData(listingView : UIView)->ListingData {
      return tableData
   }
}


// MARK: SDBasicTableView Handling
extension SDBasicTableVC : UITableViewDelegate{
   func addBasicTableView(){
      let spTableView = SPTableView(frame: self.view.frame, style: .Plain)
      self.automaticallyAdjustsScrollViewInsets = false
      spTableView.contentInset = UIEdgeInsets(top: 64,left: 0,bottom: 0,right: 0)
      
      // Set SPListingData
      tableData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: testCases)
      spTableView.controller = self

      // Set Delegate
      spTableView.delegate = self
      
      // Add SPTableView
      self.view.addSubview(spTableView)
   }
   
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      
      switch testCases[indexPath.row]{
      case kCellTypes:
         self.performSegueWithIdentifier(kSegueToSDListingTableVC, sender: self)
         
      case kRuntimeChangesTestCaseString:
         self.performSegueWithIdentifier(kSegueToSDRuntimeChangesTestCaseVC, sender: self)
         
      default:
         true
      }
   }
}
