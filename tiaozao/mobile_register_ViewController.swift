//
//  mobile_register.swift
//  tiaozao
//
//  Created by 耿直的佳哥从不胡说八道 on 2017/7/31.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class mobile_register_ViewController: UIViewController {


    @IBOutlet var mobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func error(_ sender: Any) {
        //没有填写手机号
        let phoneNumber = mobile.text
        let mobileNumber = "^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|147)\\d{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobileNumber)
        if phoneNumber?.characters.count == 0 {
            let alertController1 = UIAlertController(title:"提示",message:"还没输入手机号哦！",preferredStyle:UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController1.addAction(action1)
            self.present(alertController1,animated:true,completion: nil)
        }
        //手机号格式错误
        else if regexMobile.evaluate(with: phoneNumber) == false {
            let alertController2 = UIAlertController(title:"提示",message:"手机号格式错误！",preferredStyle:UIAlertControllerStyle.alert)
            let action2 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController2.addAction(action2)
            self.present(alertController2,animated:true,completion: nil)
        }else{
            let sb = UIStoryboard(name:"Main", bundle: nil)
            let vc1 = sb.instantiateViewController(withIdentifier: "zhuce_xuexiaozhuce") as UIViewController
            self.present(vc1, animated: true, completion: nil)
        }
    }

    
 /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
}
 */
}
