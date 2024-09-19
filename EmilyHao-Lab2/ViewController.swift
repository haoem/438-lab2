//
//  ViewController.swift
//  EmilyHao-Lab2
//
//  Created by Hao, Emily on 9/11/24.
//

import UIKit

class ViewController: UIViewController {
    // UI Outlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var foodBar: DisplayView!
    
    @IBOutlet weak var happinessVal: UILabel!
    @IBOutlet weak var foodVal: UILabel!
    
    // Interactable Objects
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    
    @IBOutlet weak var dogB: UIButton!
    @IBOutlet weak var catB: UIButton!
    @IBOutlet weak var birdieB: UIButton!
    @IBOutlet weak var bunnyB: UIButton!
    @IBOutlet weak var fishB: UIButton!
    
    // Variables (idk a less stupid name for this <3)
    var petArray: [Pet] = []
    var activePet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        petArray = initializePets()
        updateViews(pet: petArray[0])
    }
    
    func initializePets() -> [Pet] {
        let pet1 = Pet(name:"dog", image: UIImage(named:"dog")!, color: .systemRed)
        let pet2 = Pet(name:"cat", image: UIImage(named:"cat")!, color: .systemOrange)
        let pet3 = Pet(name:"bird", image: UIImage(named:"bird")!, color: .systemTeal)
        let pet4 = Pet(name:"bunny", image: UIImage(named:"bunny")!, color: .systemPink)
        let pet5 = Pet(name:"fish", image: UIImage(named:"fish")!, color: .systemBlue)
        
        return [pet1, pet2, pet3, pet4, pet5]
    }
    
    func updateViews(pet: Pet) {
        activePet = pet
        updateImage(pet: activePet!)
        
        backgroundView.backgroundColor = pet.color
        happinessBar.color = pet.color
        foodBar.color = pet.color

        playButton.tintColor = pet.color
        feedButton.tintColor = pet.color
        
        // recognizing that this is a moronic way to do it but
        dogB.tintColor = pet.color
        catB.tintColor = pet.color
        birdieB.tintColor = pet.color
        bunnyB.tintColor = pet.color
        fishB.tintColor = pet.color
        
        updateLabels(pet: activePet!)
        print("updateViews() was called, active pet is now ", pet.name)
    }
    
    // THIS IS MY CREATIVE PORTION
    func updateImage(pet: Pet) {
        imageView.image = pet.image
        
        if (pet.isDead) {
            UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn], animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
        } else {
            imageView.transform = .identity
        }
        
        if (pet.ranAway) {
            UIView.animate(withDuration: 1.0, animations: {
                self.imageView.alpha = 0.0
            }) // HELP THIS SENDS ME
        } else {
            imageView.alpha = 1.0
        }
    }
    
    func updateLabels(pet: Pet) {
        let happiness = Int(pet.happiness)
        let satiety = Int(pet.satiety)

        happinessVal.text = String("Times played: \(pet.timesPlayed)")
        foodVal.text = String("Times fed: \(pet.timesFed)")
        
        happinessBar.animateValue(to: CGFloat(happiness) / 100.0)
        foodBar.animateValue(to: CGFloat(satiety) / 100.0)
        
        updateImage(pet: pet)
    }
    
    @IBAction func dogSwitch(_ sender: Any) {
        print("pressed DOG")
        updateViews(pet: petArray[0])
    }
    @IBAction func catSwitch(_ sender: Any) {
        print("pressed CAT")
        updateViews(pet: petArray[1])
    }
    @IBAction func birdieSwitch(_ sender: Any) {
        print("pressed BIRDIE")
        updateViews(pet: petArray[2])
    }
    @IBAction func bunnySwitch(_ sender: Any) {
        print("pressed BUN")
        updateViews(pet: petArray[3])
    }
    @IBAction func fishSwitch(_ sender: Any) {
        print("pressed FISH")
        updateViews(pet: petArray[4])
    }
    
    @IBAction func playPressed(_ sender: Any) {
        print("you pressed play")
        activePet?.play()
        activePet?.typeset()
        updateLabels(pet: activePet!)
    }
    
    @IBAction func feedPressed(_ sender: Any) {
        print("you pressed feed")
        activePet?.feed()
        activePet?.typeset()
        updateLabels(pet: activePet!)
    }
    
    
}
