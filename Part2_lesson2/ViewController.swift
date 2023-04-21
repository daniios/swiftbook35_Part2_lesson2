//
//  ViewController.swift
//  Part2_lesson2
//
//  Created by Даниил Чупин on 21.04.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var lightChanger: UIButton!
    @IBOutlet weak var light: UIStackView!
    
    // MARK: - Private Properties
    private var clickCounter = 0
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lightChanger.layer.cornerRadius = 10
        turnLightOff()
    }

    // MARK: - IB Actions
    @IBAction func changeLightColor() {
        lightChanger.setTitle("NEXT", for: .normal)
        turnNextLightOn()
    }
    
    // MARK: - Private Methods
    private func turnLightOff() {
        for lightItem in light.arrangedSubviews {
            lightItem.layer.cornerRadius = lightItem.frame.width / 2
            lightItem.alpha = 0.3
        }
    }

    private func turnNextLightOn() {
        let currentLightIndex = clickCounter %
                                (light.arrangedSubviews.count * 2 - 2)
        if currentLightIndex < light.arrangedSubviews.count {
            turnLightOff()
            light.arrangedSubviews[currentLightIndex].alpha = 1
        } else {
            turnLightOff()
            light.arrangedSubviews[currentLightIndex -
                                   light.arrangedSubviews.count + 1].alpha = 1
        }
        clickCounter += 1
    }
}

