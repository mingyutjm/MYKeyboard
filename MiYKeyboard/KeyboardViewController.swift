//
//  KeyboardViewController.swift
//  MiYKeyboard
//
//  Created by MiY on 2017/3/20.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit
import SnapKit

let bannerHeight = 55 as CGFloat
let lineColor = UIColor.lightGray
let lineThickness = 0.5


class KeyboardViewController: UIInputViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var symbolStore = SymbolKeyStore()
    var keysDictionary = [String: KeyView]()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Perform custom UI setup here

        let keyboardView = defaultKeyboard()
        self.inputView?.addSubview(keyboardView)
        keyboardView.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.top.equalToSuperview()
            make.height.greaterThanOrEqualTo(216+bannerHeight)
        })

//216


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
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    
    func didTapButton(_ sender: KeyView) {
        let color = sender.backgroundColor
        if color == UIColor.lightText {
            sender.backgroundColor = UIColor.white
        } else {
            sender.backgroundColor = UIColor.lightText
        }
        
        let proxy = textDocumentProxy as UITextDocumentProxy

        
        proxy.insertText(sender.titleLabel.text!)
    } 
    
    
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

        // MARK: 左 Collection View
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 75, height: 40.5)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delaysContentTouches = false
        collectionView.canCancelContentTouches = true
        collectionView.backgroundColor = grayColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SymbolCell.self, forCellWithReuseIdentifier: "SymbolCell")
        
        bottomView.addSubview(collectionView)
        collectionView.snp.makeConstraints({ (make) -> Void in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(5)
            make.height.equalToSuperview().multipliedBy(0.75)
        })
        
        
        // MARK: 左下
        let leftBottonView = UIView()
//        leftBottonView.backgroundColor = UIColor.yellow
        bottomView.addSubview(leftBottonView)
        leftBottonView.snp.makeConstraints({ (make) -> Void in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom)
            make.width.equalTo(collectionView)
        })
        let viewLB = KeyView(withKey: Key(withTitle: "变", andType: .nextKeyboard))
        viewLB.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        leftBottonView.addSubview(viewLB)
        viewLB.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        // MARK: 右
        let rightView = UIView()
        bottomView.addSubview(rightView)
        rightView.snp.makeConstraints({ (make) -> Void in
            make.width.equalTo(collectionView)
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

        
        // MARK: 中
        let centerView = UIView()
        bottomView.addSubview(centerView)
        centerView.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(collectionView.snp.right)
            make.right.equalTo(rightView.snp.left)
        })
        
        let view11 = KeyView(withKey: Key(withTitle: "符号", andType: .changeToSymbol, typeId: 1))  //1
        let view12 = KeyView(withKey: Key(withTitle: "ABC", andType: .normal, typeId: 2))          //2
        let view13 = KeyView(withKey: Key(withTitle: "DEF", andType: .normal, typeId: 3))          //3
        let view21 = KeyView(withKey: Key(withTitle: "GHI", andType: .normal, typeId: 4))          //4
        let view22 = KeyView(withKey: Key(withTitle: "JKL", andType: .normal, typeId: 5))          //5
        let view23 = KeyView(withKey: Key(withTitle: "MNO", andType: .normal, typeId: 6))          //6
        let view31 = KeyView(withKey: Key(withTitle: "PQRS", andType: .normal, typeId: 7))         //7
        let view32 = KeyView(withKey: Key(withTitle: "TUV", andType: .normal, typeId: 8))          //8
        let view33 = KeyView(withKey: Key(withTitle: "WXYZ", andType: .normal, typeId: 9))         //9
        let view41 = KeyView(withKey: Key(withTitle: "123", andType: .changeToNumber))
        let view42 = KeyView(withKey: Key(withTitle: "空格", andType: .space, typeId: 0))           //0
        let arrMid = [view11, view12, view13, view21, view22, view23, view31, view32, view33, view41, view42]
        for view in arrMid {
            centerView.addSubview(view)
        }
        
        // MARK:
        keysDictionary["删除"] = viewR1
        keysDictionary["换行"] = viewR2
        keysDictionary["发送"] = viewR3
        keysDictionary["1"] = view11
        keysDictionary["2"] = view12
        keysDictionary["3"] = view13
        keysDictionary["4"] = view21
        keysDictionary["5"] = view22
        keysDictionary["6"] = view23
        keysDictionary["7"] = view31
        keysDictionary["8"] = view32
        keysDictionary["9"] = view33
        keysDictionary["0"] = view42
        keysDictionary["123"] = view41
        
        
        addConstraintsToMid(centerView, arrMid)
        
        //加线
        let lineBanner0 = UIView(); lineBanner0.backgroundColor = lineColor
        let lineBanner1 = UIView(); lineBanner1.backgroundColor = lineColor
        bannerView.addSubview(lineBanner0)
        bannerView.addSubview(lineBanner1)
        lineBanner0.snp.makeConstraints({ (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(lineThickness)
        })
        lineBanner1.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(bannerHeight*2/5)
            make.left.right.equalToSuperview()
            make.height.equalTo(lineThickness)
        })

        
        let lineMid0 = UIView(); lineMid0.backgroundColor = lineColor
        let lineMid1 = UIView(); lineMid1.backgroundColor = lineColor
        let lineMid2 = UIView(); lineMid2.backgroundColor = lineColor
        let lineMid3 = UIView(); lineMid3.backgroundColor = lineColor
        let lineMid4 = UIView(); lineMid4.backgroundColor = lineColor
        let lineMid5 = UIView(); lineMid5.backgroundColor = lineColor
        let lineMid6 = UIView(); lineMid6.backgroundColor = lineColor
        let lineMid7 = UIView(); lineMid7.backgroundColor = lineColor
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
            make.height.equalTo(lineThickness)
        })
        lineMid1.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(view11.snp.bottom)
            make.left.equalTo(centerView)
            make.right.equalToSuperview()
            make.height.equalTo(lineThickness)
        })
        lineMid2.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(view21.snp.bottom)
            make.left.equalTo(centerView)
            make.height.equalTo(lineThickness)
            make.right.equalToSuperview()
        })
        lineMid3.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(view31.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalTo(centerView)
            make.height.equalTo(lineThickness)
        })
        lineMid4.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(centerView)
            make.width.equalTo(lineThickness)
        })
        lineMid5.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(view12)
            make.width.equalTo(lineThickness)
        })
        lineMid6.snp.makeConstraints({ (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalTo(view33)
            make.left.equalTo(view13)
            make.width.equalTo(lineThickness)
        })
        lineMid7.snp.makeConstraints({ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(rightView)
            make.width.equalTo(lineThickness)

        })
        
        addTargetToKeys(keysDictionary)
        
        return keyboard
    }

    func addTargetToKeys(_ dict: [String: KeyView]) {
        
        for (key, value) in dict {
            switch key {
            case "2","3","4","5","6","7","8","9":
                value.addTarget(self, action: #selector(KeyboardViewController.tapNormalKey(_:)), for: .touchDown)
                
            default:
                value.addTarget(self, action: #selector(KeyboardViewController.tapOtherKey(_:)), for: .touchDown)
            }
        }
    }
    
    func tapNormalKey(_ sender: KeyView) {
        
    }
    
    func tapOtherKey(_ sender: KeyView) {
        let proxy = textDocumentProxy as UITextDocumentProxy

        let type = sender.key.type
        switch type {
        case .symbol, .number:
            proxy.insertText(sender.key.outputText!)
        case .space:
            proxy.insertText(" ")
        case .backspace:
            proxy.deleteBackward()
        case .return:
            proxy.insertText("\n")
        default:
            break
        }
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
    
    
    // MARK: Collection View Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return symbolStore.allSymbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SymbolCell", for: indexPath) as! SymbolCell
        cell.addKey(symbolStore.allSymbols[indexPath.row])
        cell.keyView?.addTarget(self, action: #selector(tapOtherKey(_:)), for: .touchUpInside)
        
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let width = collectionView.bounds.width
//        let height = collectionView.bounds.height
//        let size = CGSize(width: width, height: height/4)
//        return size
//    }


}

//扩展UICollectionView 使得滑动scrollView可以取消UIControl的点击事件
extension UICollectionView {
    override open func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}










