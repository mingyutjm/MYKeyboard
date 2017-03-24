//
//  SymbolCell.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/24.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit

class MyCollectionView: UICollectionView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}

class SymbolCell: UICollectionViewCell {
    
    var keyView: KeyView?
    let line = UIView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
    }

    
    func addKey(_ key: Key) {
        
        keyView = KeyView(withKey: key)
        
        self.contentView.addSubview(keyView!)
        self.contentView.addSubview(line)
        line.backgroundColor = lineColor
        
        keyView?.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        line.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        })

    }
    
//    init(withKey key: Key) {
//        
//        keyView = KeyView(withKey: key)
//        super.init(frame: CGRect.zero)
//        
//        self.addSubview(keyView)
//
//    }

    override func layoutSubviews() {
        

        
        super.layoutSubviews()
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}