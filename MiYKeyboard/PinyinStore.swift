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

}


var idStringDict: [String: [String]] = [
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t"],
    "9": ["w", "x", "y", "z"],
    "22": ["ba", "ca"],
    "23": ["ce"],
    "24": ["ai", "bi", "ci"],
    "26": ["co", "bo", "an", "ao"],
    "28": ["bu", "cu"],
    "32": ["da", "fa"],
    "33": ["de"],
    "34": ["di", "ei"],
    "36": ["en", "fo"],
    "37": ["er"],
    "38": ["du", "fu"],
    "42": ["ga", "ha"],
    "43": ["ge", "he"],
    "48": ["gu", "hu"],
    "52": ["ka", "la"],
    "53": ["le", "ke"],
    "54": ["ji", "li"],
    "56": ["lo"],
    "58": ["lu", "lv", "ju", "ku"],
    "62": ["ma", "na"],
    "63": ["me", "ne"],
    "64": ["mi", "ni"],
    "66": ["mo"],
    "68": ["mu", "nu", "nv", "ou"],
    "72": ["pa", "sa"],
    "73": ["re", "se"],
    "74": ["pi", "qi", "ri", "si"],
    "76": ["so", "po"],
    "78": ["pu", "qu", "ru", "su"],
    "82": ["ta"],
    "83": ["te"],
    "84": ["ti"],
    "88": ["tu"],
    "92": ["wa", "ya", "za"],
    "93": ["ze", "ye"],
    "94": ["yi", "xi", "zi"],
    "96": ["wo", "yo"],
    "98": ["wu", "xu", "yu", "zu"],
    "224": ["bai", "cai"],
    "226": ["can", "cao", "ban", "bao"],
    "234": ["bei"],
    "236": ["ben", "cen"],
    "242": ["cha"],
    "243": ["che", "bie"],
    "244": ["chi"],
    "246": ["bin"],
    "248": ["chu"],
    "264": ["ang"],
    "268": ["cou"],
    "284": ["cui"],
    "286": ["cun", "cuo"],
    "324": ["dai"],
    "326": ["dan", "dao", "fan"],
    "334": ["fei"],
    "336": ["den", "fen"],
    "342": ["dia"],
    "343": ["die"],
    "346": ["din"],
    "348": ["diu"],
    "368": ["dou", "fou"],
    "384": ["dui"],
    "386": ["dun", "duo"],
    "424": ["gai", "hai"],
    "426": ["han", "gan", "gao", "hao"],
    "434": ["hei", "gei"],
    "436": ["gen", "hen"],
    "466": ["hon", "gon"],
    "468": ["gou", "hou"],
    "482": ["hua", "gua"],
    "484": ["gui", "hui"],
    "486": ["hun", "huo", "gun", "guo"],
    "524": ["kai", "lai"],
    "526": ["lan", "kan", "kao", "lao"],
    "534": ["lei", "kei"],
    "536": ["ken", "len"],
    "542": ["jia", "lia"],
    "543": ["jie", "lie"],
    "546": ["lin", "jin"],
    "548": ["jiu", "liu"],
    "566": ["kon", "lon"],
    "568": ["kou", "lou"],
    "582": ["kua"],
    "583": ["jue", "lue"],
    "584": ["kui"],
    "586": ["lun", "luo", "kun", "kuo", "jun"],
    "624": ["mai", "nai"],
    "626": ["nan", "man", "mao", "nao"],
    "634": ["nei", "mei", "nen", "men"],
    "643": ["mie", "nie"],
    "646": ["nin", "min"],
    "648": ["miu", "niu"],
    "668": ["mou", "nou"],
    "683": ["nue"],
    "686": ["nuo"],
    "724": ["pai", "sai"],
    "726": ["san", "pan", "pao", "ran", "rao", "sao"],
    "734": ["pei"],
    "736": ["pen", "sen", "ren"],
    "742": ["sha", "qia"],
    "743": ["qie", "she", "pie"],
    "744": ["shi"],
    "746": ["qin", "pin"],
    "748": ["shu", "qiu"],
    "768": ["pou", "rou", "sou"],
    "783": ["que"],
    "784": ["rui", "sui"],
    "786": ["sun", "suo", "run", "ruo", "qun"],
    "824": ["tai"],
    "826": ["tan", "tao"],
    "836": ["ten"],
    "843": ["tie"],
    "846": ["tin"],
    "866": ["ton"],
    "868": ["tou"],
    "884": ["tui"],
    "886": ["tun", "tuo"],
    "924": ["wai", "zai"],
    "926": ["zan", "wan", "yan", "yao", "zao"],
    "934": ["zei", "wei"],
    "936": ["zen", "wen"],
    "942": ["xia", "zha"],
    "943": ["xie", "zhe"],
    "944": ["zhi"],
    "946": ["xin", "yin"],
    "948": ["xiu", "zhu"],
    "968": ["you", "zou"],
    "983": ["xue", "yue"],
    "984": ["zui"],
    "986": ["zun", "zuo", "yun", "xun"],
    "2264": ["bang", "cang"],
    "2364": ["beng", "ceng"],
    "2426": ["bian", "biao", "chan", "chao"],
    "2464": ["bing"],
    "2424": ["chai"],
    "2436": ["chen"],
    "2468": ["chou"],
    "2484": ["chui"],
    "2486": ["chun", "chuo"],
    "2664": ["cong"],
    "2826": ["cuan"],
    "3264": ["dang", "fang"],
    "3364": ["feng", "deng"],
    "3426": ["dian", "diao"],
    "3464": ["ding"],
    "3664": ["dong"],
    "3826": ["duan"],
    "4264": ["gang", "hang"],
    "4364": ["geng", "heng"],
    "4664": ["gong", "hong"],
    "4824": ["guai", "huai"],
    "4826": ["guan", "huan"],
    "5264": ["kang", "lang"],
    "5364": ["leng", "keng"],
    "5426": ["lian", "liao", "jian", "jiao"],
    "5464": ["jing", "ling"],
    "5664": ["long", "kong"],
    "5824": ["kuai"],
    "5826": ["kuan", "luan", "juan"],
    "6264": ["mang", "nang"],
    "6364": ["meng", "neng"],
    "6426": ["mian", "miao", "nian", "niao"],
    "6464": ["ming", "ning"],
    "6664": ["nong"],
    "6826": ["nuan"],
    "7264": ["pang", "rang", "sang"],
    "7364": ["peng", "seng", "reng"],
    "7424": ["shai"],
    "7426": ["shan", "shao", "pian", "piao", "qian", "qiao"],
    "7436": ["shen"],
    "7464": ["ping", "qing"],
    "7468": ["shou"],
    "7482": ["shua"],
    "7484": ["shui"],
    "7486": ["shun", "shuo"],
    "7664": ["rong", "song"],
    "7826": ["suan", "quan", "ruan"],
    "8264": ["tang"],
    "8364": ["teng"],
    "8426": ["tian", "tiao"],
    "8464": ["ting"],
    "8664": ["tong"],
    "8826": ["tuan"],
    "9264": ["wang", "zang", "yang"],
    "9364": ["weng", "zeng"],
    "9424": ["zhai"],
    "9426": ["zhan", "zhao", "xian", "xiao"],
    "9436": ["zhen"],
    "9464": ["xing", "ying"],
    "9466": ["zhon"],
    "9468": ["zhou"],
    "9482": ["zhua"],
    "9484": ["zhui"],
    "9486": ["zhun", "zhuo"],
    "9664": ["yong", "zong"],
    "9826": ["yuan", "xuan", "zuan"],
    "94264": ["xiang", "zhang"],
    "94364": ["zheng"],
    "94664": ["xiong", "zhong"],
    "94824": ["zhuai"],
    "94826": ["zhuan"],
    "24264": ["chang"],
    "24364": ["cheng"],
    "24664": ["chong"],
    "24824": ["chuai"],
    "24826": ["chuan"],
    "48264": ["guang", "huang"],
    "54264": ["jiang", "liang"],
    "54664": ["jiong"],
    "58264": ["kuang"],
    "64264": ["niang"],
    "74264": ["qiang", "shang"],
    "74364": ["sheng"],
    "74664": ["qiong"],
    "74824": ["shuai"],
    "74826": ["shuan"],
    "248264": ["chuang"],
    "748264": ["shuang"],
    "948264": ["zhuang"]
]


