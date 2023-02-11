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
    @IBOutlet weak var rollResultLabel: UILabel!
    
    // MARK: - Private properties
    
    private var player = PlayerModel()
    private var monster = MonsterModel()

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayerLabels()
        setMonsterLabels()
        setCollectiveLabels()
        setButtons()
    }
    
    // MARK: - SetLabels
    
    private func setPlayerLabels() {
        playerNameLabel.text = String(player.name)
        playerAttackLabel.text = String(player.attack)
        playerShieldLabel.text = String(player.shield)
        playerHealthLabel.text = String(player.health)
    }
    
    private func setMonsterLabels() {
        monsterNameLabel.text = String(monster.name)
        monsterAtackLabel.text = String(monster.attack)
        monsterShieldLabel.text = String(monster.shield)
        monsterHealthLabel.text = String(monster.health)
    }
    
    private func setCollectiveLabels() {
        attackLabel.text = "Attack"
        shieldLabel.text = "Shield"
        healthLabel.text = "Health"
    }
    
    // MARK: - SetButtons
    
    private func setButtons() {
        healingButton.titleLabel?.text = "Healing"
        healingButton.isHidden = true
        let health = player.health
        let halfHealth = health / 2
        if health <= halfHealth {
            healingButton.isHidden = false
        }
    }
    
    
    @IBAction func healingButtonAction(_ sender: Any) {
        let n = 0
        if n < 3 {
            var health = player.health
            let halfHealth = health / 2
            health = health + halfHealth
        }

    }
    
    @IBAction func gameButtonAction(_ sender: Any) {

    }
}
