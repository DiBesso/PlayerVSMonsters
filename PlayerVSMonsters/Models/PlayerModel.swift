//
//  PlayerModel.swift
//  PlayerVSMonsters
//
//  Created by Дмитрий Бессонов on 06.02.2023.
//

import Foundation

final class PlayerModel {
    
    let name = "Player"
    let attack = Int.random(in: 1...20)
    let shield = Int.random(in: 1...20)
    var health = Int.random(in: 1...30)
    var damage = [1...6]
    
}
