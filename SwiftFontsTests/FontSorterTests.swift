//
//  FontSorterTests.swift
//  SwiftFonts
//
//  Created by Josh Brown on 6/19/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import XCTest

class FontSorterTests: XCTestCase {
    
    let sorter = FontSorter()

    func testCompareHyphenWithNoHyphen() {
        let fonts = ["Arial-ItalicMT", "ArialMT"]
        let expected = ["ArialMT", "Arial-ItalicMT"]
        let sorted = sorter.sortFontNames(fonts)
        XCTAssertEqual(expected[0], sorted[0], "the array should be sorted properly")
        assertEquals(expected, sorted, "the array should be sorted properly")
    }
    
    func testCompareHyphenWithHyphen() {
        let fonts = ["Avenir-Roman", "Avenir-Oblique"]
        let expected = ["Avenir-Oblique", "Avenir-Roman"]
        let sorted = sorter.sortFontNames(fonts)
        assertEquals(expected, sorted)
    }
    
    func assertEquals(expected: NSObject?, _ actual: NSObject?, _ message: String? = nil) {
        if message {
            return XCTAssertEqualObjects(expected, actual, message!)
        } else {
            return XCTAssertEqualObjects(expected, actual)
        }
    }
}
