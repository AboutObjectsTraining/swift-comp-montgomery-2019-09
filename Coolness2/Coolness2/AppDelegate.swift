// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow()
        window?.backgroundColor = UIColor.yellow
        window?.rootViewController = CoolController(nibName: "CoolStuff", bundle: nil)
        window?.makeKeyAndVisible()
    }
}

extension AppDelegate
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        guard let touch = touches.first else { return }
    //        let currLocation = touch.location(in: nil)
    //        let prevLocation = touch.previousLocation(in: nil)
    //        touch.view?.frame.origin.x += currLocation.x - prevLocation.x
    //        touch.view?.frame.origin.y += currLocation.y - prevLocation.y
    //    }
}
