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
            pinyins = PinyinStore.idToStrings(id).0
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
    
    class func idToStrings(_ typeId: String) -> ([String], [String]) {
        
        var firstStrings = [String]()
        var strings = [String]()
        
        var remainingLength = typeId.characters.count
        var tempId = ""
        var index = 0
        
        for amount in (1...6).reversed() {
            if amount > remainingLength {
                continue
            }
            tempId = typeId[index...(index+amount)]
            if let tempStrings = idStringDict[tempId] {
                for tempString in tempStrings {
                    firstStrings.append(tempString)
                }
            }
        }
        
        while remainingLength > 0 {
            for amount in (1...6).reversed() {
                if amount > remainingLength {
                    continue
                }
                tempId = typeId[index...(index+amount)]
                if let tempStrings = idStringDict[tempId] {
                    for tempString in tempStrings {
                        strings.append(tempString)
                    }
                    index += amount
                    remainingLength -= amount
                    break
                }
            }
        }
        
        return (firstStrings, strings)
    }

    class func saveToHistory(withId key: String, pinyin: String, word: String) {
        
        if let dict = historyDictionary {
            let value = dict.value(forKey: key) as? NSMutableArray
            if value != nil {
                
                
                
                
                var flag = true
                var words = value?.object(at: 0) as! [String]
                for str in words {
                    if str == word {
                        flag = false
                        break
                    }
                }
                if flag {
                    words.append(word)
                }
                
            } else {
                dict.setObject([pinyin, word], forKey: key as NSCopying)
            }
            
        } else {
            let dict = NSMutableDictionary()
            dict.setObject([pinyin, word], forKey: key as NSCopying)

        }
        
    }
    
}


func stringToArray(_ str: String) -> [String] {
    
    var strings = [String]()
    
    for temp in str.characters {
        strings.append(String(temp))
    }

    return strings
}



















