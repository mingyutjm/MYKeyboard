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
    
    init(withKey key: Key) {
        super.init(frame: CGRect.zero)

        titleLabel.text = key.title
        self.addSubview(titleLabel)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
//        titleLabel.snp.makeConstraints({ (make) -> Void in
//            make.center
//        })

        super.layoutSubviews()

        
    }
    
}
