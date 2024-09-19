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
    
    // Constructuro
    init(name: String, image: UIImage, color: UIColor) {
        self.name = name
        self.image = image
        self.color = color
        self.happiness = 80
        self.satiety = 10
    }
    
    func feed() {
        satiety += 12
        if (satiety > 100) {
            satiety = 100
            happiness -= 18
            if (happiness < 0) {
                happiness = 0
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
    
    func play() {
        happiness += 22
        satiety -= 10
        
        if (happiness > 100) {
            happiness = 100
        }
        if (satiety < 0) {
            satiety = 0
        }
        print("wahoo")
    }
    
    func typeset() {
        print(name, " H: ", happiness, " S: ", satiety)
    }
}
