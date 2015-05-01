//
//  SPTableViewSectionTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPTableViewSectionTests: XCTestCase {

   
   var cellGroup1 = SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "CommonModel")
   var cellGroup2 = SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])
   var cellGroup3 = SPListingCellGroup(cellId: "SPTitleLabelCell", cellCommonModel: "CommonModel", cellModel: ["1","2"])
   
   var cellGroups : [SPListingCellGroup] = []
   var sectionData = SPTableViewSection(CellGroups: [])
   
   override func setUp() {
      super.setUp()
      
      cellGroups = [cellGroup1,cellGroup2]
      sectionData = SPTableViewSection(CellGroups: [cellGroup1,cellGroup2])
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   func testSectionDataWithOnlyCellSets(){
      XCTAssert(sectionData.spCellGroupArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithEmptyCells(){
      var sectionData = SPTableViewSection(CellGroups: [])
      XCTAssert(sectionData.spCellGroupArray.count == 0 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 0, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionHeader(){
      var sectionData = SPTableViewSection(CellGroups: cellGroups, SectionHeader: "header")
      XCTAssert(sectionData.spCellGroupArray.count == 2 &&
         sectionData.sectionHeader == "header" &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionFooter(){
      var sectionData = SPTableViewSection(CellGroups: cellGroups, SectionFooter: "footer")
      XCTAssert(sectionData.spCellGroupArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == "footer" &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionHeaderNFooter(){
      var sectionData = SPTableViewSection(CellGroups: cellGroups, SectionHeader: "header", SectionFooter : "footer")
      XCTAssert(sectionData.spCellGroupArray.count == 2 &&
         sectionData.sectionHeader == "header" &&
         sectionData.sectionFooter == "footer" &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionCellCountWithOneCellSet(){
      var sectionData = SPTableViewSection(CellGroups: [cellGroup1])
      XCTAssert(sectionData.spCellGroupArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 12, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetAppend(){
      sectionData.spCellGroupArray.append(cellGroup3)
      XCTAssert(sectionData.spCellGroupArray.count == 3 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 17, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetEdit(){
      sectionData.spCellGroupArray[1] = cellGroup3
      XCTAssert(sectionData.spCellGroupArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 14, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetRemove(){
      sectionData.spCellGroupArray.removeLast()
      XCTAssert(sectionData.spCellGroupArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 12, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetRemoveAll(){
      sectionData.spCellGroupArray.removeAll(keepCapacity: false)
      XCTAssert(sectionData.spCellGroupArray.count == 0 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 0, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetFill(){
      sectionData.spCellGroupArray.removeAll(keepCapacity: false)
      sectionData.spCellGroupArray = [cellGroup3]
      XCTAssert(sectionData.spCellGroupArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 2, "SectionData should be created with proper data")
   }
   

}