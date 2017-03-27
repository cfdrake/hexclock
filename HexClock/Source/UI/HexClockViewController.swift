//
//  HexClockViewController.swift
//  HexClock
//

import UIKit

/// Hex Clock view controller.
class HexClockViewController: UIViewController {

    // MARK: UIViewController

    override func viewDidLoad() {
        let clockView = HexClockView()
        view.addSubview(clockView)
        clockView.pinTo(view)
    }

}
