//
//  Pet.swift
//  EmilyHao-Lab2
//
//  Created by Hao, Emily on 9/19/24.
//

import Foundation
import UIKit

class Pet {
    // Class variables
    var name: String
    var image: UIImage
    var color: UIColor
    
    var happiness: Int
    var satiety: Int
    var timesPlayed: Int
    var timesFed: Int
    
    var isDead: Bool
    var ranAway: Bool
    
    // Constructuro
    init(name: String, image: UIImage, color: UIColor) {
        self.name = name
        self.image = image
        self.color = color
        
        self.happiness = 80
        self.satiety = 35
        self.timesFed = 0
        self.timesPlayed = 0
        
        self.isDead = false
        self.ranAway = false
    }
    
    func feed() {
        if (!(isDead || ranAway)) {
            timesFed += 1
            satiety += 12
            
            if (satiety > 100) {
                satiety = 100
                happiness -= 24
                if (happiness < 0) {
                    happiness = 0
                    ranAway = true
                }
                print("omnomnom :-/")
            } else {
                happiness += 2
                if (happiness > 100) {
                    happiness = 100
                }
                print("omnomnom :3c")
            }
        }
    }
    
    func play() {
        if (!(isDead || ranAway)) {
            timesPlayed += 1
            happiness += 22
            satiety -= 10
            
            if (happiness > 100) {
                happiness = 100
            }
            if (satiety < 0) {
                satiety = 0
                isDead = true
            }
            print("wahoo")
        }
    }
    
    func typeset() {
        if (!(isDead || ranAway)) {
            print(name, " H: ", happiness, " S: ", satiety)
        } else if (isDead) {
            print(name, " is dead. sad :-(")
        } else {
            print(name, " ran away!!!")
        }
    }
}
