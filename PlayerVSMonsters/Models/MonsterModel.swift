//
//  MonsterModel.swift
//  PlayerVSMonsters
//
//  Created by Дмитрий Бессонов on 06.02.2023.
//

import Foundation

final class MonsterModel {
    
    let name = "Monster"
    let attack = Int.random(in: 1...20)
    let shield = Int.random(in: 1...20)
    var health = Int.random(in: 10...30)
    var damage = Int.random(in: 1...6)
    
}
