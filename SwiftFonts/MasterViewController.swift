//
//  MasterViewController.swift
//  SwiftFonts
//
//  Created by Josh Brown on 6/3/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController
{
    let viewModel = MasterViewModel()

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return self.viewModel.numberOfSections()
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.numberOfRowsInSection(section)
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        self.configureCell(cell, atIndexPath: indexPath);
        return cell
    }

    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        let label = UILabel(frame: CGRectMake(0, 0, 280, 200))
        label.text = viewModel.titleAtIndexPath(indexPath)
        label.font = self.fontAtIndexPath(indexPath)
        label.sizeToFit()
        return max(label.font.lineHeight + label.font.ascender + -label.font.descender, 44)
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath)
    {
        cell.textLabel.text = viewModel.titleAtIndexPath(indexPath)
        cell.textLabel.font = self.fontAtIndexPath(indexPath)
    }
    
    func fontAtIndexPath(indexPath: NSIndexPath) -> UIFont
    {
        let fontName = viewModel.titleAtIndexPath(indexPath)
        return UIFont(name:fontName, size: UIFont.systemFontSize())
    }
}
