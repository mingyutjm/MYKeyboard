//
//  WordsStore.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/29.
//  Copyright © 2017年 MiY. All rights reserved.
//

import Foundation

class WordsStore {
    
    var words: [String] = []
    var pinyin: String = "" {
        didSet {
            words = stringToArray(pinyin)
        }
    }
    
    
}
