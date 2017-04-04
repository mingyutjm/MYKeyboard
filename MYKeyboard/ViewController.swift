//
//  ViewController.swift
//  MYKeyboard
//
//  Created by MiY on 2017/3/19.
//  Copyright © 2017年 MiY. All rights reserved.
//

import UIKit
import SnapKit

//let historyPath: String = { () -> String in
//    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
//    let documentsDirectory = paths.object(at: 0) as! NSString
//    let path = documentsDirectory.appendingPathComponent("TypingHistory.plist")
//    return path
//}()
//
//let historyDictionary: NSMutableDictionary? = { () -> NSMutableDictionary? in
//    let dict = NSMutableDictionary(contentsOfFile: historyPath)
//    return dict
//}()

class ViewController: UIViewController/*, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout*/ {

    let textView = UITextView()
    
    var collectionView: UICollectionView!


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
        
        
        
/*        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 5
//        layout.itemSize = CGSize(width: 50, height: 30)
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.red
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.clipsToBounds = false
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(50)
            make.bottom.equalTo(-50)
            make.left.equalTo(100)
            make.width.equalTo(30)
        })

        collectionView.register(MyConllectionViewCell.self, forCellWithReuseIdentifier: "Cell")
*/
//        

    }

    /*
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyConllectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        let size = CGSize(width: width, height: height/5)
        return size
    }
*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class MyConllectionViewCell: UICollectionViewCell {
    
    var blueView: UIView
    
    override init(frame: CGRect) {
        
        blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        super.init(frame: frame)
        
        self.addSubview(blueView)
        blueView.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

