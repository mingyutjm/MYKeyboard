//
//  KeyView.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/22.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit

class KeyView: UIControl {
    
    let titleLabel = UILabel()
    let key: Key?
    
    init(withKey key: Key) {
        self.key = key

        super.init(frame: CGRect.zero)
        updateBackgroundColorWithType(key.type)


        titleLabel.text = key.title
        titleLabel.sizeToFit()
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.center.equalToSuperview()
        })

        super.layoutSubviews()

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let color = self.backgroundColor
        if color == UIColor.white {
            self.backgroundColor = UIColor.lightText
        } else {
            self.backgroundColor = UIColor.white
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        updateBackgroundColorWithType(key!.type)
    }

    func updateBackgroundColorWithType(_ type: KeyType) {
        switch type {
        case .symbol,
             .backspace,
             .changeToSymbol,
             .nextKeyboard:
            backgroundColor = UIColor.lightText
        case .return:
            backgroundColor = UIColor.init(colorLiteralRed: 10/255.0, green: 96/255.0, blue: 254/255.0, alpha: 0.95)
            
        default:
            backgroundColor = UIColor.white
        }

    }
}





