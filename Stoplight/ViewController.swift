//
//  ViewController.swift
//  Stoplight
//
//  Created by Chandler Barnes on 6/7/17.
//  Copyright © 2017 Chandler Barnes. All rights reserved.
//

import Cocoa
import ORSSerial


class ViewController: NSViewController {
    
    @IBOutlet weak var radio_zone: NSButton!
    @IBOutlet weak var radio_work: NSButton!
    @IBOutlet weak var radio_free: NSButton!
    
    @IBOutlet var textScroll: NSTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curApps()
        var score: NSInteger = 1
        let color = NSData(bytes: &score, length: MemoryLayout<NSInteger>.size)
        
        
        guard let serialPort = ORSSerialPort(path: "/dev/cu.usbmodem1441") else {
            return
        }
        serialPort.baudRate = 9600
        serialPort.open()
        serialPort.send(color as Data) // someData is an NSData object
        
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window!.title = "Project Firefly"
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func radioButtonChanged(_ sender: NSButton) {
        
        
        /*for curApp in NSWorkspace.shared().runningApplications {
            if curApp.isActive {
                NSLog(curApp)
            }
        }*/
        
        curApps()
        
        var score: Int = 1
        NSLog("Radio button clicked.")
        
        
        switch sender as NSButton {
        case radio_zone:
        NSLog("I'm in the zone.")
            score = 1
        // do some stuff
        // ...
        case radio_work:
        NSLog("I'm working.")
            score = 2
        // do some stuff
        // ...
        case radio_free:
        NSLog("I'm free.")
            score = 3
        // do some stuff
        // ...
        default:
        NSLog("And I'm Patrick.")
        }
        
        
        let color = NSData(bytes: &score, length: MemoryLayout<Int>.size)
        guard let serialPort = ORSSerialPort(path: "/dev/cu.usbmodem1441") else {
            return
        }
        serialPort.send(color as Data) // someData is an NSData object
    }
    
    func curApps() {
        let apps = NSWorkspace.shared().runningApplications
        
        
        for currentApp in apps.enumerated(){
            let runningApp = apps[currentApp.offset]
            
            if(runningApp.activationPolicy == .regular){
                print(runningApp.localizedName);
                let attr = NSAttributedString(string: runningApp.localizedName! + "\n")
                
                textScroll.textStorage?.append(attr)
            }
        }
        
    }

}
