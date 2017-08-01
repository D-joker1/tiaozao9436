//
//  school_register_ViewController.swift
//  tiaozao
//
//  Created by david on 2017/8/1.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class school_register_ViewController:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //选择器
    var pickerView:UIPickerView!
    
    //所以地址数据集合
    var schoolArray = [[String: AnyObject]]()
    
    //选择的省索引
    var provinceIndex = 0
    //选择的市索引
    var cityIndex = 0
    //选择的县索引
    var schoolIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据
        let path = Bundle.main.path(forResource: "school", ofType:"plist")
        self.schoolArray = NSArray(contentsOfFile: path!) as! Array
        
        //创建选择器
        pickerView=UIPickerView(frame: CGRect(x:0,y:270,width:375,height:290))
        pickerView.isHidden=true
        //将dataSource设置成自己
        pickerView.dataSource=self
        //将delegate设置成自己
        pickerView.delegate=self
        self.view.addSubview(pickerView)
        
        
    }
    
    @IBAction func kaishixuanze(_ sender: Any) {
        pickerView.isHidden = false
    }

    
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //设置选择框的行数，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.schoolArray.count
        } else if component == 1 {
            let province = self.schoolArray[provinceIndex]
            return province["cities"]!.count
        } else {
            let province = self.schoolArray[provinceIndex]
            if let city = province["cities"]![cityIndex] as? [String: AnyObject] {
                return city["school"]!.count
            } else {
                return 0
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if(component == 0 || component == 1){
            //第一、二列变宽
            return 80
        }else{
            //三列变窄
            return 200
        }
    }
    
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if component == 0 {
            return self.schoolArray[row]["state"] as? String
        }else if component == 1 {
            let province = self.schoolArray[provinceIndex]
            let city = province["cities"]![row] as! [String: AnyObject]
            return city["city"] as? String
        }else {
            let province = self.schoolArray[provinceIndex]
            let city = province["cities"]![cityIndex] as! [String: AnyObject]
            return city["school"]![row] as? String
        }
    }
    
    //选中项改变事件（将在滑动停止后触发）
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        //根据列、行索引判断需要改变数据的区域
        switch (component) {
        case 0:
            provinceIndex = row;
            cityIndex = 0;
            schoolIndex = 0;
            pickerView.reloadComponent(1);
            pickerView.reloadComponent(2);
            pickerView.selectRow(0, inComponent: 1, animated: false);
            pickerView.selectRow(0, inComponent: 2, animated: false);
        case 1:
            cityIndex = row;
            schoolIndex = 0;
            pickerView.reloadComponent(2);
            pickerView.selectRow(0, inComponent: 2, animated: false);
        case 2:
            schoolIndex = row;
        default:
            break;
        }
    }

    @IBOutlet weak var sheng: UILabel!
    @IBOutlet weak var shi: UILabel!
    @IBOutlet weak var xuexiao: UILabel!

    
    @IBAction func queding(_ sender: Any) {
        pickerView.isHidden = true
        //获取选中的省
        let p = self.schoolArray[provinceIndex]
        let province = p["state"]!
        
        //获取选中的市
        let c = p["cities"]![cityIndex] as! [String: AnyObject]
        let city = c["city"] as! String
        
        //获取选中的学校
        var schools = ""
        if (c["school"] as! [String]).count > 0 {
            schools = (c["school"] as! [String])[schoolIndex]
        }
        sheng.text = province as! String
        shi.text = city
        xuexiao.text = schools
        
    }
    
}
