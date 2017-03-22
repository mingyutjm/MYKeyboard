//
//  ViewController.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/19.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let textView = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.backgroundColor = UIColor.groupTableViewBackground
        self.view.addSubview(textView)
        textView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(50)
            make.height.equalTo(200)
        })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

