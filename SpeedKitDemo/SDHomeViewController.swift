//
//  SDHomeViewController.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

///Home Controller of SpeedKit Demo Project. It contains different use cases which can be implemented using SpeedKit.
class SDHomeViewController: UIViewController {
    
    ///As per SPListingTableVC description
    ///
    ///1. You need to set spListingData - Listing Automation Compatible. When you change spListingData you must call reloadSPListingTableVC method.
    var spListingData : SPListingData = SPListingData([])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add Table View Controller using speedkit framework
        self.addTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("didReceiveMemoryWarning")
    }
}


//MARK: Add Table View
extension SDHomeViewController{
    func addTableView(){
        // Create listingVC from generic SPListingTableVC factory method to be added as child view controller.
        if let listingVC = SPListingTableVC.getNewInstance(){
            
            // This is the model we need to show in TableView
            var section0Rows = [
                "Basic TableView",
                "Custom TableView"]
            
//            // To display contents inside listingVC we would need spListingData.
//            // Below there is stepwise comment to create spListingData.
//            
//            // Step 1: Create Similar Cell Data required in First Section. 
//            // Here we need all label cells with text in it. So We would create Cell Data containing SPTitleLabelCell Data.
//
//                // Step 1.1: Create Cell CommonModel If only required.
//                var spTitleLabelCellCommonModel = SPTitleLabelCellCommonModel(TextColor: UIColor.darkGrayColor())
//            
//                // Step 1.2: Create Cell Model Array.
//                var spTitleLabelCellModelArray : [SPTitleLabelCellModel] = []
//            
//                for rowTitle in section0Rows{
//                    spTitleLabelCellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
//                }
//            
//                // Step 1.3: Create spListingCellData Instance using above two models.
//                var spListingCellData = SPListingCellData(cellId: kCellIdSPTitleLabelCell,
//                    cellModelCommon: spTitleLabelCellCommonModel,
//                    cellModel: spTitleLabelCellModelArray)
//            
//            // Step 2: Create Section data containing different Cell Data set. 
//            // Here we only need one set of Cell Data created above.
//            var spListingSection0Data = SPListingSectionData(Cells: [spListingCellData])
//            
//            // Step 3: Create full listing data containing different sections mentioned above.
//            // Here we only need one section created above.
//            spListingData = SPListingData([spListingSection0Data]);
            
            // Assign spListingData to listingVC
            listingVC.spListingData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: section0Rows)
            
            // Assign yourself as delegate to get callback for table row didSelect event.
            listingVC.delegate = self
            
            // Use SpeedKit UI Helper factory class to add listingVC to this controller.
            SPUIHelper.add(child: listingVC, into: self, atPosition: self.view.frame)
        }
    }
}

extension SDHomeViewController : SPListingTableVCDelegateProtocol{
    /// This method will get called on tableview row selection
    func spTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0{
            self.performSegueWithIdentifier(kSegueToSDBasicTableVC, sender: self)
        }
    }
}


