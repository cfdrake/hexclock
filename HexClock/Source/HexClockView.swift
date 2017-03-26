//
//  HexClockView.swift
//  HexClock
//

import UIKit

/// Hex Clock view.
final class HexClockView: UIView {

    // MARK: Properties

    private var clockLabel: UILabel?
    private var timer: Timer?

    // MARK: Initialization

    init() {
        // Choose an arbitrary, default frame.
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
        addSubview(clockLabel)

        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.textColor = UIColor.white
        clockLabel.textAlignment = .center
        clockLabel.font = UIFont.systemFont(ofSize: 250, weight: UIFontWeightUltraLight)
        clockLabel.pinTo(self)

        self.clockLabel = clockLabel

        // Setup timer.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                self.updateTime()
            }
        }

        updateTime(initialLoad: true)
    }

    // MARK: Actions

    private func updateTime(initialLoad: Bool = false) {
        let now = Date()
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: now)

        guard let hour = components.hour,
            let minute = components.minute,
            let second = components.second else { return }

        // Update clock display.
        clockLabel?.text = "#\(hour)\(minute)\(second)"

        // Fade to next color.
        let animate = {
            self.backgroundColor = UIColor.fromTime(hour: hour, minute: minute, second: second)
        }

        if initialLoad {
            animate()
        } else {
            UIView.animate(withDuration: 1.0, animations: animate)
        }
    }

}
