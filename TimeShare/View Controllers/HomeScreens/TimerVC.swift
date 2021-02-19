//
//  TimerVC.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import UICircularProgressRing
import SwiftUI

class TimerVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var progressRing: UICircularProgressRing!
    
    var members = Array(repeating: MemberModel(name: "Fake Name", avatarURL: "TESTURKL", goal: "JUST A GOAL"), count: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        styleProgressRing()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Somewhere not in viewDidLoad (since the views have not set yet, thus cannot be animated)
        // Remember to use unowned or weak self if referencing self to avoid retain cycle
        progressRing.startProgress(to: 100, duration: 2.0) {
            print("Done animating!")
        }
    }

    private func styleProgressRing() {
        // Looked up in UICircularRing.swift
        progressRing.startAngle = CGFloat(270)
        progressRing.outerRingColor = UIColor.clear
        progressRing.innerRingColor = UIColor(named: K.BrandColors.color6)!
        progressRing.innerRingWidth = 10
        progressRing.font = UIFont.systemFont(ofSize: 30)
        progressRing.valueFormatter = TimerVCProgressRingFormatter(valueIndicator: "min left.");
    }
}

// MARK: - UITableViewDataSource

extension TimerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.memberIdentifier, for: indexPath)
        cell.textLabel?.text = members[indexPath.row].name
        // TODO: Add more attributes
        return cell
    }
}

class TimerVCProgressRingFormatter: UICircularRingValueFormatter{
    // MARK: Members

    /**
     The name of the value indicator the value label will
     appened to the value
     Example: " GB" -> "100 GB"

     ## Important ##
     Default = "%"

     ## Author
     Luis Padron
     */
    public var valueIndicator: String

    /**
     A toggle for either placing the value indicator right or left to the value
     Example: true -> "GB 100" (instead of 100 GB)

     ## Important ##
     Default = false (place value indicator to the right)

     ## Author
     Elad Hayun
     */
    public var rightToLeft: Bool

    /**
     A toggle for showing or hiding floating points from
     the value in the value label

     ## Important ##
     Default = false (dont show)

     To customize number of decmial places to show, assign a value to decimalPlaces.

     ## Author
     Luis Padron
     */
    public var showFloatingPoint: Bool

    /**
     The amount of decimal places to show in the value label

     ## Important ##
     Default = 2

     Only used when showFloatingPoint = true

     ## Author
     Luis Padron
     */
    public var decimalPlaces: Int

    // MARK: Init

    public init(valueIndicator: String = "%",
                rightToLeft: Bool = false,
                showFloatingPoint: Bool = false,
                decimalPlaces: Int = 2) {
        self.valueIndicator = valueIndicator
        self.rightToLeft = rightToLeft
        self.showFloatingPoint = showFloatingPoint
        self.decimalPlaces = decimalPlaces
    }

    // MARK: API

    /// formats the value of the progress ring using the given properties
    public func string(for value: Any) -> String? {
        guard var value = value as? CGFloat else { return nil }
        value = 100 - value // TODO Better Code. Reverse the value for string.

        if rightToLeft {
            if showFloatingPoint {
                return "\(valueIndicator)" + String(format: "%.\(decimalPlaces)f", value)
            } else {
                return "\(valueIndicator)\(Int(value))"
            }

        } else {
            if showFloatingPoint {
                // TODO Fix this string
                return String(format: "%.\(decimalPlaces)f", value) + "\(valueIndicator)"
            } else {
                return "\(Int(value))\(valueIndicator)"
            }
        }
    }
}