//
//  DataStruct.swift
//  Triple Bubbles
//
//  Created by Huiyuan Ren on 16/2/9.
//  Copyright © 2016年 User. All rights reserved.
//

import Foundation

public struct DataStruct {
    static let EASY = 0
    static let MEDIUM = 1
    static let HARD = 2
    static var difficulty = 0
    static var playing = false
    static var gameViewController: GameViewController? = nil
    static var monsterViewController: MonsterViewController? = nil
}