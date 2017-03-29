//
//  PinyinStore.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/29.
//  Copyright © 2017年 MiY. All rights reserved.
//

import Foundation

class PinyinStore {
    
    var id: String = "" {
        didSet {
            pinyins = PinyinStore.idToStrings(id)
        }
    }
    var pinyins = [String]()
    var splitedPinyinString: String {
        get {
            return PinyinStore.splitPinyinStrings(pinyins)
        }
    }

    class func splitPinyinStrings(_ strings: [String]) -> String {
        var str = ""
        for pinyin in strings {
            if pinyin != strings.last {
                str += "\(pinyin)'"
            } else {
                str += pinyin
            }
        }
        return str
    }
    
    class func idToStrings(_ typeId: String) -> [String] {
        
        var strings = [String]()
        
        strings = ["jin", "tian", "tian", "qi"]
        
        
        return strings
    }
}
