//
//  MasterViewModel.swift
//  SwiftFonts
//
//  Created by Josh Brown on 6/26/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit

class MasterViewModel
{
    var familyNames : [String]
    var fonts = [String: [String]]()

    init()
    {
        let unsortedFamilyNames = UIFont.familyNames() 
        familyNames = unsortedFamilyNames.sort()
        
        let sorter = FontSorter()
        for familyName in familyNames
        {
            let unsortedFontNames = UIFont.fontNamesForFamilyName(familyName) 
            fonts[familyName] = sorter.sortFontNames(unsortedFontNames)
        }
    }
    
    func numberOfSections() -> Int
    {
        return familyNames.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int
    {
        let key = familyNames[section]
        let array = fonts[key]!
        return array.count
    }
    
    func titleAtIndexPath(indexPath: NSIndexPath) -> String
    {
        let key = familyNames[indexPath.section]
        let array = fonts[key]
        let fontName = array![indexPath.row]
        return fontName
    }
}