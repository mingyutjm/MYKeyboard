//
//  ExtraView.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/20.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit

class ExtraView: UIView {
    
    var globalColors: GlobalColors.Type?
    var darkMode: Bool
    var solidColorMode: Bool
    
    required init(globalColors: GlobalColors.Type?, darkMode: Bool, solidColorMode: Bool) {
        self.globalColors = globalColors
        self.darkMode = darkMode
        self.solidColorMode = solidColorMode
        
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.globalColors = nil
        self.darkMode = false
        self.solidColorMode = false
        
        super.init(coder: aDecoder)
    }
}
