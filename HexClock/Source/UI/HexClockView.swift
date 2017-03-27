//
//  HexClockView.swift
//  HexClock
//

import UIKit

/// Applies a property-change block, with or without, animations depending on the `animated` flag.
func animateOrApply(animationDuration: TimeInterval, animated: Bool, block: @escaping () -> Void) {
    if animated {
        UIView.animate(withDuration: animationDuration, animations: block)
    } else {
        block()
    }
}

/// Hex Clock view.
final class HexClockView: UIView {

    // MARK: Properties

    private var clockLabel: UILabel?
    private var timer: Timer?

    // MARK: Initialization

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: UIView

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        // Create clock label.
        let clockLabel = UILabel()

        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.textColor = UIColor.white
        clockLabel.textAlignment = .center
        clockLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 250, weight: UIFontWeightUltraLight)

        addSubview(clockLabel)
        clockLabel.pinTo(self)

        self.clockLabel = clockLabel

        // Setup timer.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                self.updateTime()
            }
        }

        updateTime(animated: false)
    }

    // MARK: Actions

    private func updateTime(animated: Bool = true) {
        let now = Date()
        let (hour, minute, second) = now.timeComponents
        let padNumber = { n in String(format: "%02d", n) }

        clockLabel?.text = "#\(padNumber(hour))\(padNumber(minute))\(padNumber(second))"

        animateOrApply(animationDuration: 1.0, animated: animated) {
            self.backgroundColor = UIColor.fromTime(hour: hour, minute: minute, second: second)
        }
    }

}
