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
    @IBOutlet weak var shieldSlider: UISlider!
    @IBOutlet weak var healthSlider: UISlider!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    // MARK: - Properties
    
    var playerName = ""
    

    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameTextField.delegate = self
        setNavigation()
        setPlayerNameTextField()
        setPlayerNameLabel()
        setStartButton()
    }
    
    
    // MARK: - Navigation
    
    private func setNavigation () {
        navigationItem.title = "Player creation"
    }
    
    // MARK: - Setting label
    
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
    
    // MARK: - Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "startToFightSegue" else { return }
        guard let destination = segue.destination as? FightViewController else { return }
        
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
