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
    
    let bannerHeight = 55 as CGFloat
    
    
    
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
        

        let keyboardView = defaultKeyboard()
        self.inputView?.addSubview(keyboardView)
        keyboardView.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.top.equalToSuperview()
            make.height.greaterThanOrEqualTo(216+bannerHeight)
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

    
    func defaultKeyboard() -> UIView {
        
        let keyboard = UIView(frame: CGRect.zero)
        
        //上
        let bannerView = UIView()
        keyboard.addSubview(bannerView)
        bannerView.backgroundColor = UIColor.white
        bannerView.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(bannerHeight)
        })
        
        
        //下
        let bottomView = UIView()
        keyboard.addSubview(bottomView)
        bottomView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(bannerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        })

        
        
        //左
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = grayColor
        bottomView.addSubview(scrollView)
        scrollView.snp.makeConstraints({ (make) -> Void in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(5)
            make.height.equalToSuperview().multipliedBy(0.75)
        })
        let viewL0 = KeyView(withKey: Key(withTitle: " ，", andType: .symbol))
        let viewL1 = KeyView(withKey: Key(withTitle: " 。", andType: .symbol))
        let viewL2 = KeyView(withKey: Key(withTitle: "~", andType: .symbol))
        let viewL3 = KeyView(withKey: Key(withTitle: " ？", andType: .symbol))
        let viewL4 = KeyView(withKey: Key(withTitle: " ！", andType: .symbol))
        let viewL5 = KeyView(withKey: Key(withTitle: " 、", andType: .symbol))
        let contentView = UIView()
        contentView.backgroundColor = UIColor.lightGray
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints({ (make) -> Void in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        })
        contentView.addSubview(viewL0)
        contentView.addSubview(viewL1)
        contentView.addSubview(viewL2)
        contentView.addSubview(viewL3)
        contentView.addSubview(viewL4)
        contentView.addSubview(viewL5)
        viewL0.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.width.equalTo(bottomView).dividedBy(5)
            make.height.equalTo(bottomView).multipliedBy(0.1875)
        })
        viewL1.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(viewL0.snp.bottom).offset(0.5)
            make.width.height.equalTo(viewL0)
        })
        viewL2.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(viewL1.snp.bottom).offset(0.5)
            make.width.height.equalTo(viewL0)
        })
        viewL3.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(viewL2.snp.bottom).offset(0.5)
            make.width.height.equalTo(viewL0)
        })
        viewL4.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(viewL3.snp.bottom).offset(0.5)
            make.width.height.equalTo(viewL0)
        })
        viewL5.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(viewL4.snp.bottom).offset(0.5)
            make.width.height.equalTo(viewL0)
        })
        contentView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(viewL5)
        })

        
        
        //左下
        let leftBottonView = UIView()
//        leftBottonView.backgroundColor = UIColor.yellow
        bottomView.addSubview(leftBottonView)
        leftBottonView.snp.makeConstraints({ (make) -> Void in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom)
            make.width.equalTo(scrollView)
        })
        let viewLB = KeyView(withKey: Key(withTitle: "变", andType: .nextKeyboard))
        viewLB.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        leftBottonView.addSubview(viewLB)
        viewLB.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        //右
        let rightView = UIView()
//        rightView.backgroundColor = UIColor.blue
        bottomView.addSubview(rightView)
        rightView.snp.makeConstraints({ (make) -> Void in
            make.width.equalTo(scrollView)
            make.top.right.bottom.equalToSuperview()
        })
        
        let viewR1 = KeyView(withKey: Key(withTitle: "⬅︎", andType: .backspace))
        let viewR2 = KeyView(withKey: Key(withTitle: "换行", andType: .backspace))
        let viewR3 = KeyView(withKey: Key(withTitle: "发送", andType: .return))
        rightView.addSubview(viewR1)
        rightView.addSubview(viewR2)
        rightView.addSubview(viewR3)
        viewR1.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        })
        viewR2.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(viewR1.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        })
        viewR3.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(viewR2.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        })


        
        
        
        //中
        let centerView = UIView()
//        centerView.backgroundColor = UIColor.cyan
        bottomView.addSubview(centerView)
        centerView.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(scrollView.snp.right)
            make.right.equalTo(rightView.snp.left)
        })
        
        let view11 = KeyView(withKey: Key(withTitle: "符号", andType: .changeToSymbol))
        let view12 = KeyView(withKey: Key(withTitle: "ABC", andType: .normal))
        let view13 = KeyView(withKey: Key(withTitle: "DEF", andType: .normal))
        let view21 = KeyView(withKey: Key(withTitle: "GHI", andType: .normal))
        let view22 = KeyView(withKey: Key(withTitle: "JKL", andType: .normal))
        let view23 = KeyView(withKey: Key(withTitle: "MNO", andType: .normal))
        let view31 = KeyView(withKey: Key(withTitle: "PQRS", andType: .normal))
        let view32 = KeyView(withKey: Key(withTitle: "TUV", andType: .normal))
        let view33 = KeyView(withKey: Key(withTitle: "WXYZ", andType: .normal))
        let view41 = KeyView(withKey: Key(withTitle: "123", andType: .changeToNumber))
        let view42 = KeyView(withKey: Key(withTitle: "空格", andType: .space))
        let arrMid = [view11, view12, view13, view21, view22, view23, view31, view32, view33, view41, view42]
        for view in arrMid {
            centerView.addSubview(view)
        }
        
        addConstraintsToMid(centerView, arrMid)
        
        
        //加线
        let thickness = 0.5
        let color = UIColor.lightGray
        let lineBanner0 = UIView(); lineBanner0.backgroundColor = color
        let lineBanner1 = UIView(); lineBanner1.backgroundColor = color
        bannerView.addSubview(lineBanner0)
        bannerView.addSubview(lineBanner1)
        lineBanner0.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(thickness)
        })
        lineBanner1.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(bannerHeight*2/5)
            make.left.right.equalToSuperview()
            make.height.equalTo(thickness)
        })

        
        let lineMid0 = UIView(); lineMid0.backgroundColor = color
        let lineMid1 = UIView(); lineMid1.backgroundColor = color
        let lineMid2 = UIView(); lineMid2.backgroundColor = color
        let lineMid3 = UIView(); lineMid3.backgroundColor = color
        let lineMid4 = UIView(); lineMid4.backgroundColor = color
        let lineMid5 = UIView(); lineMid5.backgroundColor = color
        let lineMid6 = UIView(); lineMid6.backgroundColor = color
        let lineMid7 = UIView(); lineMid7.backgroundColor = color
        bottomView.addSubview(lineMid0)
        bottomView.addSubview(lineMid1)
        bottomView.addSubview(lineMid2)
        bottomView.addSubview(lineMid3)
        bottomView.addSubview(lineMid4)
        bottomView.addSubview(lineMid5)
        bottomView.addSubview(lineMid6)
        bottomView.addSubview(lineMid7)
        lineMid0.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(thickness)
        })
        lineMid1.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(view11.snp.bottom)
            make.left.equalTo(centerView)
            make.right.equalToSuperview()
            make.height.equalTo(thickness)
        })
        lineMid2.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(view21.snp.bottom)
            make.left.equalTo(centerView)
            make.height.equalTo(thickness)
            make.right.equalToSuperview()
        })
        lineMid3.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(view31.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalTo(centerView)
            make.height.equalTo(thickness)
        })
        lineMid4.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(centerView)
            make.width.equalTo(thickness)
        })
        lineMid5.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(view12)
            make.width.equalTo(thickness)
        })
        lineMid6.snp.makeConstraints({ (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalTo(view33)
            make.left.equalTo(view13)
            make.width.equalTo(thickness)
        })
        lineMid7.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(rightView)
            make.width.equalTo(thickness)

        })

        
        return keyboard
    }


    
    func addConstraintsToMid(_ centerView: UIView, _ arr: [KeyView]) {
        var top = centerView.snp.top
        var left = centerView.snp.left
        for (index, view) in arr.enumerated() {
            if index == 10 {
                view.snp.makeConstraints({ (make) -> Void in
                    make.height.equalToSuperview().dividedBy(4)
                    make.right.equalToSuperview()
                    make.left.equalTo(left)
                    make.top.equalTo(top)
                })

                break
            }
            if index % 3 == 2 {
                view.snp.makeConstraints({ (make) -> Void in
                    make.height.equalToSuperview().dividedBy(4)
                    make.width.equalToSuperview().dividedBy(3)
                    make.left.equalTo(left)
                    make.top.equalTo(top)
                })
                top = view.snp.bottom
                left = centerView.snp.left

            } else {
                view.snp.makeConstraints({ (make) -> Void in
                    make.height.equalToSuperview().dividedBy(4)
                    make.width.equalToSuperview().dividedBy(3)
                    make.left.equalTo(left)
                    make.top.equalTo(top)
                })
                left = view.snp.right
            }
        }
    }
}














