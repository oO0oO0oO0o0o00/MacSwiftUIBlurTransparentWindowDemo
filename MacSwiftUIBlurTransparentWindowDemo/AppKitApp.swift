//
//  AppDelegate.swift
//  MacAppExample
//
//  Created by MeowCat on 2025/11/30.
//

import Cocoa

//@main
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let window = NSWindow()
        let view = BackdropView()
        view.material = .fullScreenUI
        view.blendingMode = .behindWindow
        view.state = .active
        view.frame = .init(x: 0, y: 0, width: 600, height: 400)
        window.contentView = view
        window.setFrame(.init(x: 0, y: 0, width: 600, height: 400), display: false)
        window.styleMask.insert(.closable)
        window.center()
        window.makeKeyAndOrderFront(self)
    }
    
    static func main() {
        let delegate = AppDelegate()
        NSApplication.shared.delegate = delegate
        NSApplication.shared.run()
    }
}
