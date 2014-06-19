//
//  ViewController.swift
//  SwiftFonts
//
//  Created by Josh Brown on 6/3/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit

class ViewController: UITableViewController
{
    var familyNames : Array<String> = []
    var fonts : Dictionary<String, String[]> = [:]

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)

        let sorter = FontSorter()
        let unsortedFamilyNames = UIFont.familyNames() as String[]
        familyNames = sort(unsortedFamilyNames)

        for familyName in familyNames
        {
            let unsortedFontNames = UIFont.fontNamesForFamilyName(familyName) as String[]
            fonts[familyName] = sorter.sortFontNames(unsortedFontNames)
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return countElements(familyNames)
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        let key = familyNames[section]
        let array : String[] = fonts[key]!
        return countElements(array)
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        let key = familyNames[indexPath.section]
        let array = fonts[key]
        let fontName = array![indexPath.row]

        cell.textLabel.text = fontName
        cell.textLabel.font = UIFont(name:fontName, size: UIFont.systemFontSize())

        return cell
    }

    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        let key = familyNames[indexPath.section]
        let array = fonts[key]
        let fontName = array![indexPath.row]

        let label = UILabel(frame: CGRectMake(0, 0, 280, 200))
        label.text = fontName
        label.font = UIFont(name: fontName, size: UIFont.systemFontSize())
        label.sizeToFit()

        return max(label.font.lineHeight + label.font.ascender + -label.font.descender, 44)
    }
}
