//
//  ViewController.swift
//  Part2_lesson2
//
//  Created by Даниил Чупин on 21.04.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var lightChangerButton: UIButton!
    @IBOutlet weak var trafficLight: UIStackView!
    
    // MARK: - Private Properties
    private var clickCounter = 0
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lightChangerButton.layer.cornerRadius = 10
        turnLightOff()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for lightItem in trafficLight.arrangedSubviews {
            lightItem.layer.cornerRadius = lightItem.frame.width / 2
        }
    }

    // MARK: - IB Actions
    @IBAction func changeLightColor() {
        lightChangerButton.setTitle("NEXT", for: .normal)
        turnNextLightOn()
    }
    
    // MARK: - Private Methods
    private func turnLightOff() {
        for lightItem in trafficLight.arrangedSubviews {
            lightItem.alpha = 0.3
        }
    }

    private func turnNextLightOn() {
        let currentLightIndex = clickCounter %
                                (trafficLight.arrangedSubviews.count * 2 - 2)
        if currentLightIndex < trafficLight.arrangedSubviews.count {
            turnLightOff()
            trafficLight.arrangedSubviews[currentLightIndex].alpha = 1
        } else {
            turnLightOff()
            trafficLight.arrangedSubviews[currentLightIndex -
                                   trafficLight.arrangedSubviews.count + 1].alpha = 1
        }
        clickCounter += 1
    }
}

