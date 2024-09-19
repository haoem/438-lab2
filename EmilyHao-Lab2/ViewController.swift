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
        happinessBar.value = 0.5
        happinessBar.color = .darkGray
        happinessBar.animateValue(to: 1.0)
        
        foodBar.value = 0.5
        foodBar.color = .darkGray
        foodBar.animateValue(to: 1.0)
        
        petArray = initializePets()
        
        updateViews(pet: petArray[0])
    }
    
    func initializePets() -> [Pet] {
        let pet1 = Pet(name:"dog", image: UIImage(named:"dog")!, color: .red)
        let pet2 = Pet(name:"cat", image: UIImage(named:"cat")!, color: .yellow)
        let pet3 = Pet(name:"bird", image: UIImage(named:"bird")!, color: .green)
        let pet4 = Pet(name:"bunny", image: UIImage(named:"bunny")!, color: .blue)
        let pet5 = Pet(name:"fish", image: UIImage(named:"fish")!, color: .purple)
        
        return [pet1, pet2, pet3, pet4, pet5]
    }
    
    func updateViews(pet: Pet) {
        imageView.image = pet.image
        backgroundView.backgroundColor = pet.color
        activePet = pet
        updateLabels(pet: activePet!)
        print("updateViews() was called, active pet is now ", pet.name)
    }
    
    func updateLabels(pet: Pet) {
        let happiness = Int(pet.happiness)
        let satiety = Int(pet.satiety)

        happinessVal.text = String(happiness)
        foodVal.text = String(satiety)
        
        happinessBar.animateValue(to: CGFloat(happiness) / 100.0)
        foodBar.animateValue(to: CGFloat(satiety) / 100.0)
        print("updateLabels() was called on a nil")
    }
    
    func updateBars(pet: Pet) {
        
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
