
//
//  SPCollectionViewSectionTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPCollectionViewSectionTests: XCTestCase {

   var cellGroup1 = SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "CommonModel")
   var cellGroup2 = SPListingCellGroup(cellId: "SPTitleLabelCell",cellModelArray: ["1","2","3"])
   
   var sectionData = SPCollectionViewSection(CellGroups: [])
   
   override func setUp() {
      super.setUp()
      
      sectionData = SPCollectionViewSection(CellGroups: [cellGroup1,cellGroup2])
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   func testSectionDataWithOnlyCellSets(){
      XCTAssert(sectionData.spCellGroupArray.count == 2 &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
}