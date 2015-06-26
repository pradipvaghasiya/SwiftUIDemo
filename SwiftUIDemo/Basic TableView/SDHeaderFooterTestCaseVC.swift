//
//  SDHeaderFooterTestCaseVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 17/04/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

class SDHeaderFooterTestCaseVC: UIViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.title = "Header and Footer"
      
      // Add TableView using SpeedKit
      self.addBasicTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

// MARK: SDBasicTableView Handling
extension SDHeaderFooterTestCaseVC : UITableViewDelegate{
   func addBasicTableView(){
      let spTableView = SPTableView(frame: self.view.frame, style: .Plain)
      
      let section0 = ["section 0, Row 1","section 0, Row 2","section 0, Row 3"]
      let section1 = ["section 1, Row 1","section 1, Row 2","section 1, Row 3"]
      
      // CellModel Section 0
      var spTitleLabelSection0CellModelArray : [ViewModelType] = []
      
      for rowTitle in section0{
         spTitleLabelSection0CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      // CellModel Section 1
      var spTitleLabelSection1CellModelArray : [ViewModelType] = []
      
      for rowTitle in section1{
         spTitleLabelSection1CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      

      var section0Data = TableViewSection(viewModels: spTitleLabelSection0CellModelArray)
      section0Data.sectionHeader = "Section 0 Header String"
      section0Data.sectionFooter = "Section 0 Footer String"
      
      var section1Data = TableViewSection(viewModels: spTitleLabelSection1CellModelArray)
      section1Data.sectionHeader = "Section 1 Header String"
      section1Data.sectionFooter = "Section 1 Footer String"
      
      // Set SPListingData
      let listingData = ListingData(sections: [section0Data,section1Data])
      spTableView.listingData = listingData
      
      // Set Delegate
      spTableView.delegate = self
      
      // Add SPTableView
      self.view.addSubview(spTableView)
      
   }
   
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
   }
}

