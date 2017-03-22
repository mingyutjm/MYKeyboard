//
//  KeyboardModel.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/22.
//  Copyright © 2017年 MiY. All rights reserved.
//

import Foundation

enum KeyType {
    case normal         //9宫格普通按键
    case symbol         //符号
    case backspace      //删除
    case space          //空格
    case `return`       //回车
    case nextKeyboard   //切换输入法
    case changeToNumber //切换到数字输入面板
    case changeToSymbol //切换到符号面板
    case number         //数字
}

class Key {
    
    let title: String?
    let type: KeyType
    var outputText: String?
    
    init(withTitle title:String, andType type: KeyType) {
        
        self.title = title
        self.type = type
        createOutputTextWithType(type)
    }
    
    func createOutputTextWithType(_ type: KeyType) {
        
        switch type {
        case .normal:
            outputText = title
        case .symbol:
            outputText = title
        case .number:
            outputText = title

        default:
            outputText = nil
        }
    }
}







