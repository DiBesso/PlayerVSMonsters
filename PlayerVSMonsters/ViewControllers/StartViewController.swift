//
//  StartViewController.swift
//  PlayerVSMonsters
//
//  Created by Дмитрий Бессонов on 11.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var attackSliderLabel: UILabel!
    @IBOutlet weak var attackResultLabel: UILabel!
    
    @IBOutlet weak var shieldSlider: UISlider!
    @IBOutlet weak var shieldSliderLabel: UILabel!
    @IBOutlet weak var shieldResultLabel: UILabel!
    
    @IBOutlet weak var healthSlider: UISlider!
    @IBOutlet weak var healthSliderLabel: UILabel!
    @IBOutlet weak var healthResultLabel: UILabel!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    // MARK: - Private properties
    
    private var playerModel = PlayerModel()
    private var model = Model ()
    private var attackValue = 1
    private var shieldValue = 1
    private var healthValue = 1
    
    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameTextField.delegate = self
        setNavigation()
        setPlayerNameTextField()
        setPlayerNameLabel()
        setStartButton()
        setSliders(for: attackSlider, shieldSlider, healthSlider)
        setResultLabel()
        setValue()
    }
    
    
    // MARK: - Navigation
    
    private func setNavigation () {
        navigationItem.title = "Player creation"
    }
    
    // MARK: - Setting labels
    
    private func setResultLabel() {
        attackResultLabel.text = String(playerModel.attack)
        attackResultLabel.textAlignment = .left
        shieldResultLabel.text = String(playerModel.shield)
        shieldResultLabel.textAlignment = .left
        healthResultLabel.text = String(playerModel.health)
        healthResultLabel.textAlignment = .left
    }
    
    private func setPlayerNameLabel () {
        playerNameLabel.text = "Create a player"
    }
    
    // MARK: - Setting TextField
    
    private func setPlayerNameTextField() {
        playerNameTextField.placeholder = "Enter player name"
        
    }
    
    // MARK: - Setting button
    
    private func setStartButton() {
        startGameButton.titleLabel?.text = "Start"
    }
    
    @IBAction func startGameAction(_ sender: Any) {
    }
    
    // MARK: - Setting sliders
    
    private func setSliders(for sliders: UISlider...) {
        
        sliders.forEach {slider in
            
            switch slider {
            case attackSlider:
                attackSlider.maximumValue = 20
                attackSlider.minimumValue = 1
                attackSlider.value = Float(playerModel.attack)
                attackSlider.backgroundColor = .lightGray
                attackSlider.tintColor = .red
                attackSlider.layer.cornerRadius = 15
                attackSliderLabel.text = model.attackLabel
                attackSliderLabel.textAlignment = .center
                
            case shieldSlider:
                shieldSlider.minimumValue = 1
                shieldSlider.maximumValue = 20
                shieldSlider.value = Float(playerModel.shield)
                shieldSlider.backgroundColor = .lightGray
                shieldSlider.tintColor = .blue
                shieldSlider.layer.cornerRadius = 15
                shieldSliderLabel.text = model.shieldLabel
                shieldSliderLabel.textAlignment = .center
                
            default:
                healthSlider.minimumValue = 1
                healthSlider.maximumValue = 20
                healthSlider.value = Float(playerModel.health)
                healthSlider.backgroundColor = .lightGray
                healthSlider.tintColor = .green
                healthSlider.layer.cornerRadius = 15
                healthSliderLabel.text = model.healthLabel
                healthSliderLabel.textAlignment = .center
            }
        }
    }
    
    private func setValue() {
        
        attackValue = Int(attackSlider.value)
        shieldValue = Int(shieldSlider.value)
        healthValue = Int(healthSlider.value)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setValue()
        
        switch sender {
        case attackSlider:
            attackResultLabel.text = String(attackValue)
        case shieldSlider:
            shieldResultLabel.text = String(shieldValue)
        default:
            healthResultLabel.text = String(healthValue)
        }
    }
    
    
    // MARK: - Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "startToFightSegue" else { return }
        guard let destination = segue.destination as? FightViewController else { return }
        
        
        destination.attack = String(attackValue)
        destination.shield = String(shieldValue)
        destination.health = healthValue
        
        if playerNameTextField.text == "" {
            destination.playerName = "Player"
        } else {
            destination.playerName = playerNameTextField.text ?? "Player"
        }
    }
}

// MARK: - Extension

extension StartViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let newText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return newText.count <= 15
    }
}
