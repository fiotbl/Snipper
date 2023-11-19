//
//  SnipperApp.swift
//  Snipper
//
//  Created by Fiora Tan on 1/5/23.
//

import SwiftUI

@main
struct SnippetApp: App {
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBarItem: NSStatusItem?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
        
        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        // Create the Status Bar Item with the Popover
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem?.button {
            button.image = NSImage(systemSymbolName: "note.text", accessibilityDescription: "Snippet Manager")
            button.action = #selector(togglePopover(_:))
        }
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusBarItem?.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
