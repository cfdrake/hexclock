//
//  AppDelegate.swift
//  HexClock
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties

    var window: UIWindow?

    // MARK: UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Avoid showing the screensaver while running this app.
        application.isIdleTimerDisabled = true

        window = UIWindow()
        window?.rootViewController = HexClockViewController()
        window?.makeKeyAndVisible()
        return true
    }

}
