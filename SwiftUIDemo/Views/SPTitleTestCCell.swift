//
//  SPTitleTestCCell.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

///Reusable Cell Id defined in xib file and xib file name itself. Both must be same.
public let kCellIdSPTitleTestCCell = "SPTitleTestCCell"

//Default Label Parameters
private let kDefaultFontSize : CGFloat = 16.0
private let kDefaultFont = UIFont.systemFontOfSize(kDefaultFontSize)
private let kDefaultTextColor = UIColor.blackColor()
private let kDefaultTextAlignment : NSTextAlignment = .Left

// MARK: Cell Configuration
///This cell shows single label covered in whole length and height
class SPTitleTestCCell: SPCollectionCell {
   ///Title Label IBOutlet
   @IBOutlet var titleLabel: UILabel?

   // SPListingCellProtocol
   override func configureCell(){
      //If model is of type SPTitleTestCCellModel, It would set title text.
      if let myModel = viewModel as? SPTitleTestCCellModel{
         self.titleLabel?.text = myModel.titleText
         
         return
      }
      
      print("Please pass correct model")
   }
}

// MARK: Helper Methods
extension SPTitleTestCCell{
   
   ///This method creates basic default SPListingData with one section from given array.
   ///
   ///:param: stringArray Array of string using which SPListingData would be created.
   ///
   ///:returns: SPListingData which can be used to create CollectionView using SwiftUI
   class func getBasicDefaultSPListingData(UsingStringArray stringArray: [String]) ->
      ListingData{
      
      let section : ListingSection = []
      
      for rowTitle in stringArray{
         section.append(SPTitleTestCCellModel(TitleText: rowTitle))
      }
      
      return [section]
   }
}

// MARK: Cell Model
///This model contains only one title property.
class SPTitleTestCCellModel : NSObject, ViewModelType{
   let cellId = kCellIdSPTitleTestCCell
   let cellType = CellType.Nib
   var serverId: Any?
    
   ///Cell label Title Text
   var titleText:String
   init(TitleText text:String){
      self.titleText = text
   }
}

