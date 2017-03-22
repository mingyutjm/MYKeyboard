//
//  KeyboardViewController.swift
//  MiYKeyboard
//
//  Created by MiY on 2017/3/20.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit
import SnapKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    var bannerView = UIView()
    let bannerHeight = 50
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        self.bannerView.backgroundColor = UIColor.brown
        self.view.addSubview(self.bannerView)
        self.bannerView.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(bannerHeight)
        })

        let keyboardView = defaultKeyboard()
        self.view.addSubview(keyboardView)
        keyboardView.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.bannerView.snp.bottom)
        })
        
//216

//        let key = Key(withTitle: "ABC", andType: .return)
//        let keyView = KeyView(withKey: key)
//        self.view.addSubview(keyView)
//        keyView.snp.makeConstraints({ (make) -> Void in
//            make.left.top.equalToSuperview()
//            make.width.equalToSuperview().multipliedBy(0.75)
//            make.height.equalTo(50)
//        })
//        keyView.addTarget(self, action: #selector(KeyboardViewController.didTapButton(_:)), for: .touchDown)
    }
    
//    override func viewDidLayoutSubviews() {
//        
////        super.viewDidLayoutSubviews()
//        
//        let frame = self.view.frame
//        self.view.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: CGFloat(bannerHeight)+frame.height))
//        
//        
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        let frame = self.view.frame
//        self.view.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: CGFloat(bannerHeight)+frame.height))
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    
    func didTapButton(_ sender: KeyView) {
//        let color = sender.backgroundColor
//        if color == UIColor.lightText {
//            sender.backgroundColor = UIColor.white
//        } else {
//            sender.backgroundColor = UIColor.lightText
//        }
        
        let proxy = textDocumentProxy as UITextDocumentProxy

        
        proxy.insertText(sender.titleLabel.text!)
    } 
    
//    override func loadView() {
//        super.loadView()
//        
//        
//    }


}

func defaultKeyboard() -> UIView {
    
    let keyboard = UIView(frame: CGRect.zero)
    
    
    //左
    let scrollView = UIScrollView()
    scrollView.backgroundColor = UIColor.red
    keyboard.addSubview(scrollView)
    scrollView.snp.makeConstraints({ (make) -> Void in
        make.left.top.equalToSuperview()
        make.width.equalToSuperview().dividedBy(5)
        make.height.equalToSuperview().multipliedBy(0.75)
    })
    
    let leftBottonView = UIView()
    leftBottonView.backgroundColor = UIColor.yellow
    keyboard.addSubview(leftBottonView)
    leftBottonView.snp.makeConstraints({ (make) -> Void in
        make.left.bottom.equalToSuperview()
        make.top.equalTo(scrollView.snp.bottom)
        make.width.equalTo(scrollView)
    })

    
    //右
    let rightView = UIView()
    rightView.backgroundColor = UIColor.blue
    keyboard.addSubview(rightView)
    rightView.snp.makeConstraints({ (make) -> Void in
        make.width.equalTo(scrollView)
        make.top.right.bottom.equalToSuperview()
    })

    
    
    //中
    let centerView = UIView()
    centerView.backgroundColor = UIColor.cyan
    keyboard.addSubview(centerView)
    centerView.snp.makeConstraints({ (make) -> Void in
        make.top.bottom.equalToSuperview()
        make.left.equalTo(scrollView.snp.right)
        make.right.equalTo(rightView.snp.left)
    })
    
    
    
    
    return keyboard
}













