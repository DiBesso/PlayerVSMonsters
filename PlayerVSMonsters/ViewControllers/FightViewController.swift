//
//  FightViewController.swift
//  PlayerVSMonsters
//
//  Created by Дмитрий Бессонов on 06.02.2023.
//

import UIKit

class FightViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var monsterNameLabel: UILabel!
    @IBOutlet weak var playerAttackLabel: UILabel!
    @IBOutlet weak var playerShieldLabel: UILabel!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var shieldLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var monsterAtackLabel: UILabel!
    @IBOutlet weak var monsterShieldLabel: UILabel!
    @IBOutlet weak var monsterHealthLabel: UILabel!
    @IBOutlet weak var healingButton: UIButton!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var monsterAttackButton: UIButton!
    @IBOutlet weak var rollResultLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var moveResultLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    // MARK: - Properties
    var playerName = ""
    var attack = ""
    var shield = ""
    var health = 0
    var numberOfHealing = 0
    var maxHealth = 0
    
    // MARK: - Private properties
    
    private var player = PlayerModel()
    private var monster = MonsterModel()
    private var model = Model ()
    
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayerLabels()
        setMonsterLabels()
        setCollectiveLabels()
        healing()
        setGameButton()
        moveResultLabel.isHidden = true
        rollResultLabel.isHidden = true
        restartButton.isHidden = true
        monsterAttackButton.isHidden = true
        maxHealth = health
    }
    
    
    // MARK: - Setting Labels
    
    private func setPlayerLabels() {
        
        playerNameLabel.text = playerName
        playerAttackLabel.text = attack
        playerShieldLabel.text = shield
        playerHealthLabel.text = String(health)
    }
    
    private func setMonsterLabels() {
        monsterNameLabel.text = String(monster.name)
        monsterAtackLabel.text = String(monster.attack)
        monsterShieldLabel.text = String(monster.shield)
        monsterHealthLabel.text = String(monster.health)
    }
    
    private func setCollectiveLabels() {
        attackLabel.text = model.attackLabel
        shieldLabel.text = model.shieldLabel
        healthLabel.text = model.healthLabel
    }
    
    // MARK: - Setting Buttons
    
    private func healing() {
        healingButton.titleLabel?.text = model.healingButtonTitle
        let allHealth = maxHealth
        let halfHealth = allHealth / 2
        health = health + halfHealth
        playerHealthLabel.text = String(health)
    }
    
    @IBAction func healingButtonAction(_ sender: Any) {
        if numberOfHealing < 3 {
            healing()
        } else {
            healingButton.isHidden = true
        }
        numberOfHealing += 1
    }
    
    @IBAction func restartButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func exitButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func gameButtonAction(_ sender: Any) {
            playerAttack()
    }
    
    @IBAction func monsterAttackAction(_ sender: Any) {
            monsterAttack()
    }
    
    private func setGameButton() {
        gameButton.titleLabel?.text = model.gameButtonTitle
    }
    
    
    // MARK: - Player attcak
    
    private func playerAttack() {
        
        if health > 0 {
            
            var modifier = player.attack - monster.shield + 1
            
            if modifier > 0 {
                let array = [1...modifier]
                for _ in array {
                    let cube = Int.random(in: 1...6)
                    rollResultLabel.isHidden = false
                    rollResultLabel.text = "Roll result is \(String(cube))"
                    if cube > 4 {
                        monster.health = monster.health - player.damage
                        monsterHealthLabel.text = String(monster.health)
                        moveResultLabel.isHidden = false
                        moveResultLabel.text = "Succes! Damage \(player.damage)"
                        if monster.health <= 0 {
                            moveResultLabel.text = "You win!!!"
                            gameButton.isHidden = true
                            monsterAttackButton.isHidden = true
                            restartButton.isHidden = false
                        }
                        gameButton.isHidden = true
                        monsterAttackButton.isHidden = false
                    } else {
                        moveResultLabel.isHidden = false
                        moveResultLabel.text = "Failed attack!"
                        gameButton.isHidden = true
                        monsterAttackButton.isHidden = false
                    }
                }
            } else {
                modifier = 1
                let cube = Int.random(in: 1...6)
                rollResultLabel.isHidden = false
                rollResultLabel.text = "Roll result is \(String(cube))"
                if cube > 4 {
                    monster.health = monster.health - player.damage
                    monsterHealthLabel.text = String(monster.health)
                    moveResultLabel.isHidden = false
                    moveResultLabel.text = "Succes! Damage \(player.damage)"
                    if monster.health <= 0 {
                        moveResultLabel.text = "You win!!!"
                        gameButton.isHidden = true
                        monsterAttackButton.isHidden = true
                        restartButton.isHidden = false
                    } else {
                        gameButton.isHidden = true
                        monsterAttackButton.isHidden = false
                    }
                } else {
                    moveResultLabel.isHidden = false
                    moveResultLabel.text = "Failed attack!"
                    gameButton.isHidden = true
                    monsterAttackButton.isHidden = false
                }
            }
        } else {
            gameButton.isHidden = true
        }
    }
    
    
    // MARK: - Monster attack
    
    private func monsterAttack() {
        
        if monster.health > 0 {
            
            var modifier = monster.attack - player.shield + 1
            
            if modifier > 0 {
                let array = [1...modifier]
                for _ in array {
                    let cube = Int.random(in: 1...6)
                    rollResultLabel.isHidden = false
                    rollResultLabel.text = "Roll result is \(String(cube))"
                    if cube > 4 {
                        health = health - monster.damage
                        playerHealthLabel.text = String(health)
                        moveResultLabel.isHidden = false
                        moveResultLabel.text = "Monster attacked! Damage \(monster.damage)"
                        if player.health <= 0 {
                            moveResultLabel.text = "Monster win!!!"
                            gameButton.isHidden = true
                            monsterAttackButton.isHidden = true
                            restartButton.isHidden = false
                        } else {
                            monsterAttackButton.isHidden = true
                            gameButton.isHidden = false
                        }
                    } else {
                        moveResultLabel.isHidden = false
                        moveResultLabel.text = "Monster failed attack!"
                        monsterAttackButton.isHidden = true
                        gameButton.isHidden = false
                    }
                }
            } else {
                modifier = 1
                let cube = Int.random(in: 1...6)
                rollResultLabel.isHidden = false
                rollResultLabel.text = "Roll result is \(String(cube))"
                if cube > 4 {
                    health = health - monster.damage
                    playerHealthLabel.text = String(health)
                    moveResultLabel.isHidden = false
                    moveResultLabel.text = "Monster attacked! Damage \(monster.damage)"
                    if health <= 0 {
                        moveResultLabel.text = "Monster win!!!"
                        gameButton.isHidden = true
                        monsterAttackButton.isHidden = true
                        restartButton.isHidden = false
                    }
                    monsterAttackButton.isHidden = true
                    gameButton.isHidden = false
                } else {
                    moveResultLabel.isHidden = false
                    moveResultLabel.text = "Monster failed attack!"
                    monsterAttackButton.isHidden = true
                    gameButton.isHidden = false
                }
            }
        } else {
            monsterAttackButton.isHidden = true
        }
    }
}


