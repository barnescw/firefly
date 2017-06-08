//
//  Window2.swift
//  Stoplight
//
//  Created by Chandler Barnes on 6/8/17.
//  Copyright © 2017 Chandler Barnes. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var greenButton: NSButton!
    @IBOutlet weak var yellowButton: NSButton!
    @IBOutlet weak var redButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    @IBAction func TouchGreen(_ sender: Any) {
        greenButton.isEnabled = true
        if #available(OSX 10.12.2, *) {
            greenButton.bezelColor=NSColor.green
        } else {
            // Fallback on earlier versions
        };
        if #available(OSX 10.12.2, *) {
            yellowButton.bezelColor=NSColor.darkGray
        } else {
            // Fallback on earlier versions
        };
        if #available(OSX 10.12.2, *) {
            redButton.bezelColor=NSColor.darkGray
        } else {
            // Fallback on earlier versions
        };
    }
    
    @IBAction func TouchYellow(_ sender: Any) {
        yellowButton.isEnabled = true
        if #available(OSX 10.12.2, *) {
        greenButton.bezelColor=NSColor.darkGray
        } else {
        // Fallback on earlier versions
        };
        if #available(OSX 10.12.2, *) {
            yellowButton.bezelColor=NSColor.yellow
        } else {
            // Fallback on earlier versions
        };
        if #available(OSX 10.12.2, *) {
            redButton.bezelColor=NSColor.darkGray
        } else {
            // Fallback on earlier versions
        };
    }
    @IBAction func TouchRed(_ sender: Any) {
        redButton.isEnabled = true
        if #available(OSX 10.12.2, *) {
        greenButton.bezelColor=NSColor.darkGray
    } else {
        // Fallback on earlier versions
        };
        if #available(OSX 10.12.2, *) {
            yellowButton.bezelColor=NSColor.darkGray
        } else {
            // Fallback on earlier versions
        };
        if #available(OSX 10.12.2, *) {
            redButton.bezelColor=NSColor.red
        } else {
            // Fallback on earlier versions
        };
    }
    
}
