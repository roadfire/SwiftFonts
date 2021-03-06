//
//  FontSorter.swift
//  SwiftFonts
//
//  Created by Josh Brown on 6/19/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import Foundation

class FontSorter
{
    /* This function is necessary because fonts shouldn't always be sorted alphabetically.
       For example, ArialMT should come before Arial-BoldItalicMT,
       but if we sort alphabetically, it doesn't. */
    func sortFontNames(array: [String]) -> [String]
    {
        let predicate = { (s1: String, s2: String) -> Bool in
            let count1 = s1.componentsSeparatedByString("-").count
            let s1ContainsHyphen = count1 != 1

            let count2 = s2.componentsSeparatedByString("-").count
            let s2ContainsHyphen = count2 != 1
            
            if (s1ContainsHyphen && s2ContainsHyphen)
            {
                return s1 < s2
            }
            else
            {
                // if s1 doesn't contain a hyphen, it should appear before s2
                if !s1ContainsHyphen
                {
                    return true
                }
                
                // if s2 doesn't contain a hyphen, it should appear before s1
                if !s2ContainsHyphen
                {
                    return false
                }
            }
            
            // otherwise, a normal string compare will be fine
            return s1 < s2
        }
        
        return array.sort(predicate)
    }
}