//
//  ViewController2.swift
//  testCollectionView
//
//  Created by lixiang on 2017/12/16.
//  Copyright © 2017年 lixiang. All rights reserved.
//

import UIKit

let BlackColor = #colorLiteral(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.0)
let MainColor = #colorLiteral(red: 1, green: 0.596, blue: 0, alpha: 1)

class ViewController2: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    private var collectionView : UICollectionView!
    
    private let field1 = UITextField(frame: CGRect(x: 20, y:gap + 44*0, width: WidthOfScreen-40, height: 40))
    private let field2 = UITextField(frame: CGRect(x: 20, y:gap + 44*1, width: WidthOfScreen-40, height: 40))
    private let field3 = UITextField(frame: CGRect(x: 20, y:gap + 44*2, width: WidthOfScreen-40, height: 40))
    private let field4 = UITextField(frame: CGRect(x: 20, y:gap + 44*3, width: WidthOfScreen-40, height: 40))
    private let field5 = UITextField(frame: CGRect(x: 20, y:gap + 44*4, width: WidthOfScreen-40, height: 40))
    private let field6 = UITextField(frame: CGRect(x: 20, y:gap + 44*5, width: WidthOfScreen-40, height: 40))
    private let field7 = UITextField(frame: CGRect(x: 20, y:gap + 44*6, width: WidthOfScreen-40, height: 40))
    private let field8 = UITextField(frame: CGRect(x: 20, y:gap + 44*7, width: WidthOfScreen-40, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNav()
        createFields()
    }
    
    private func createNav(){
        title = "测试布局"
        let leftItem = UIBarButtonItem(title:"取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title:"确定", style: UIBarButtonItemStyle.plain, target: self, action: #selector(confirm))
        navigationItem.rightBarButtonItem = rightItem
    }
    
    private func createFields(){
        field1.placeholder = "cellwidth"
        field1.borderStyle = UITextBorderStyle.roundedRect
        field1.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field1)
        
        field2.placeholder = "cellheight"
        field2.borderStyle = UITextBorderStyle.roundedRect
        field2.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field2)
        
        field3.placeholder = "minimumLineSpacing"
        field3.borderStyle = UITextBorderStyle.roundedRect
        field3.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field3)
        
        field4.placeholder = "minimumInteritemSpacing"
        field4.borderStyle = UITextBorderStyle.roundedRect
        field4.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field4)
        
        field5.placeholder = "edgeInset top"
        field5.borderStyle = UITextBorderStyle.roundedRect
        field5.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field5)
        
        field6.placeholder = "edgeInset left"
        field6.borderStyle = UITextBorderStyle.roundedRect
        field6.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field6)
        
        field7.placeholder = "edgeInset bottom"
        field7.borderStyle = UITextBorderStyle.roundedRect
        field7.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field7)
        
        field8.placeholder = "edgeInset right"
        field8.borderStyle = UITextBorderStyle.roundedRect
        field8.keyboardType = UIKeyboardType.numberPad
        view.addSubview(field8)
    }
    
    @objc func confirm() {
        if collectionView == nil {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize.init(width:(field1.text! as NSString).doubleValue,
                                          height:(field2.text! as NSString).doubleValue)
            layout.minimumLineSpacing = CGFloat((field3.text! as NSString).doubleValue)
            layout.minimumInteritemSpacing = CGFloat((field4.text! as NSString).doubleValue)
            layout.sectionInset = UIEdgeInsetsMake(CGFloat((field5.text! as NSString).doubleValue),
                                                   CGFloat((field6.text! as NSString).doubleValue),
                                                   CGFloat((field7.text! as NSString).doubleValue),
                                                   CGFloat((field8.text! as NSString).doubleValue))
            collectionView = UICollectionView(frame:CGRect(x:0, y:64, width:WidthOfScreen, height:HeightOfScreen-64),collectionViewLayout:layout)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = .white
            collectionView.register(GoodsListPagesViewClctCell.self, forCellWithReuseIdentifier:"GoodsListPagesViewClctCell")
            view.addSubview(collectionView)
        }
    }
    
    @objc func cancel() {
        if collectionView != nil {
            collectionView.removeFromSuperview()
            collectionView = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"GoodsListPagesViewClctCell",for:indexPath) as! GoodsListPagesViewClctCell
        cell.titleLabel.text = "\(indexPath.item+1)"
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

class GoodsListPagesViewClctCell: UICollectionViewCell {
    
    lazy var titleLabel: MyBlackLabel = {
        let label = MyBlackLabel(size: 15, numberOfLines: 1, align: MyAlign.center, textColor: .white)
        label.layer.cornerRadius = 12.5
        label.layer.masksToBounds = true
        label.backgroundColor = MainColor
        return label
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(contentView)
            make.width.height.equalTo(25)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public enum MyAlign : Int {
    case center
    case left
    case right
}

class MyBlackLabel: UILabel {
    
    convenience init(size:CGFloat,numberOfLines:Int=1,align:MyAlign=MyAlign.left,textColor:UIColor=BlackColor) {
        self.init()
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize:size)
        self.numberOfLines = numberOfLines
        switch (align){
        case .center:
            self.textAlignment = NSTextAlignment.center
        case .right:
            self.textAlignment = NSTextAlignment.right
        default:
            self.textAlignment = NSTextAlignment.left
        }
    }
    
    convenience init(font:UIFont,numberOfLines:Int=1,align:MyAlign=MyAlign.left,textColor:UIColor=BlackColor) {
        self.init()
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        switch (align){
        case .center:
            self.textAlignment = NSTextAlignment.center
        case .right:
            self.textAlignment = NSTextAlignment.right
        default:
            self.textAlignment = NSTextAlignment.left
        }
    }
    
}

class MyBlackButton: UIButton {
    
    convenience init(size:CGFloat,align:MyAlign=MyAlign.center,textColor:UIColor = BlackColor) {
        self.init()
        self.titleLabel?.font = UIFont.systemFont(ofSize: size)
        self.setTitleColor(textColor, for: UIControlState.normal)
        switch (align){
        case .left:
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        case .right:
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        default:
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        }
    }
    
    convenience init(font:UIFont,align:MyAlign=MyAlign.center,textColor:UIColor = BlackColor) {
        self.init()
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: UIControlState.normal)
        switch (align){
        case .left:
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        case .right:
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        default:
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        }
    }
    
}
