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
    
    // MARK: - Private properties
     let minValue = 1
     let maxValue = 10
     lazy var valuesRange = minValue...maxValue
    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavigation()
        setTextField()
    }
    
    // MARK: - Navigation
    
    func setNavigation () {
        navigationItem.title = "Создание персонажа"
    }
    
    // MARK: - TextField
    
    func setTextField() {
        playerNameTextField.placeholder = "Введите имя игрока"
    }
    @IBAction func startGameAction(_ sender: Any) {
    }
    
}

// MARK: - Extension

extension StartViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
         func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
             
             if range.length + range.location > playerNameTextField.text?.count ?? 1 {
                 return false
             }
             let newText = (playerNameTextField.text?.count)! + string.count - range.length
             
             return newText <= 10
           }
    
}
