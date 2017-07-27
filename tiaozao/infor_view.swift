//
//  infor_view.swift
//  tiaozao
//
//  Created by david on 2017/7/27.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class infor_view: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let infor_button=UITabBarItem(title:"消息",image:UIImage(named:"消息.png"),tag:1)
        self.tabBarItem=infor_button
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
