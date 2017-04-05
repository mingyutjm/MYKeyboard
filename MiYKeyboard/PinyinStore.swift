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
            
            isInHistory = PinyinStore.findIdInHistory(id)
            if isInHistory {
                let value = historyDictionary?.value(forKey: id) as? Array<[String]>
                pinyinHistory = value![0][0]
                words = value![1]
            }
            if id == "" {
                words.removeAll()
                pinyins.removeAll()
            } else {
                pinyins = idToStrings(id, startIndex: indexStore.last!).0
                if pinyins.count > 0 {
                    if let str = pinyinToWord[pinyins[currentIndex]] {
                        words = stringToArray(str)
                    }
                } else {
                    words.removeAll()
                }
            }
        }
    }
    
    var currentIndex = 0 {                   //当前选拼音的位置
        didSet {
            if pinyins.count > 0 {
                if let str = pinyinToWord[pinyins[currentIndex]] {
                    words = stringToArray(str)
                    pinyinSelected = pinyins[currentIndex]
                }
            }
        }
    }
    var indexStore = [0]                    //记录
    var isInHistory: Bool = false           //历史记录中是否有
    var pinyins = [String]()                //当前字的拼音
    var pinyinHistory: String = ""          //历史记录中的分好词的拼音
    var pinyinSelected = ""                 //已经选中的拼音
    var wordSelected = [String]()           //已选中的字
    
    var splitedPinyinString: String {       //分好词的结果
        get {
            if isInHistory {
                return pinyinHistory
            } else {
                return PinyinStore.splitPinyinStrings(idToStrings(id, startIndex: indexStore.last!).1)
            }
        }
    }
    
    var words: [String] = []
    
    func clearData() {
        id = ""
        currentIndex = 0
        indexStore = [0]
        isInHistory = false
        pinyins = []
        pinyinHistory = ""
        pinyinSelected = ""
        wordSelected = []
    }
    
    class func findIdInHistory(_ key: String) -> Bool {
        
        if let dict = historyDictionary {
            
            let value = dict.value(forKey: key) as? Array<[String]>
            if value != nil {       //历史记录里有
                return true
            } else {
                return false
            }
            
        } else {
            return false
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
    
    func idToStrings(_ typeId: String, startIndex: Int) -> ([String], [String]) {
        
        var firstStrings = [String]()
        var strings = [String]()
        
        var remainingLength = typeId.characters.count
        var tempId = ""
        var index = startIndex
        remainingLength -= indexStore.last!


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
        
        for str in wordSelected {
            strings.append(str)
        }
        if pinyinSelected.characters.count > 0 {
            strings.append(pinyinSelected)
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
                        break
                    }
                    index += amount
                    remainingLength -= amount
                    break
                }
            }
        }
        
        return (firstStrings, strings)
    }    
}


func stringToArray(_ str: String) -> [String] {
    
    var strings = [String]()
    
    for temp in str.characters {
        strings.append(String(temp))
    }

    return strings
}



















