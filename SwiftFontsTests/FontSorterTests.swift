//
//  FontSorterTests.swift
//  SwiftFonts
//
//  Created by Josh Brown on 6/19/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import XCTest
import SwiftFonts

class FontSorterTests: XCTestCase {
    
    let sorter = FontSorter()

    func testCompareHyphenWithNoHyphen() {
        let fonts = ["Arial-ItalicMT", "ArialMT"]
        let expected = ["ArialMT", "Arial-ItalicMT"]
        let sorted = sorter.sortFontNames(fonts)
        XCTAssertEqualObjects(expected, sorted, "the array should be sorted properly")
    }
    
    func testCompareHyphenWithHyphen() {
        let fonts = ["Avenir-Roman", "Avenir-Oblique"]
        let expected = ["Avenir-Oblique", "Avenir-Roman"]
        let sorted = sorter.sortFontNames(fonts)
        XCTAssertEqualObjects(expected, sorted, "when two fonts contain a hyphen, they should be sorted alphabetically")
    }
}
