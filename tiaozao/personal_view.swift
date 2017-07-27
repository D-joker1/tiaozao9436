//
//  personal_view.swift
//  tiaozao
//
//  Created by david on 2017/7/27.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class personal_view: UIViewController {

    var mydata=NSArray(objects:"个人","历史","关于我们","设置","注销","登录")
    
    func numberOfSectionInTableView(_ tableView:UITableView) -> Int{
        return 1
    }
    func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int) -> Int{
        return mydata.count
    }
    func tableView(_ tableView:UITableView,cellForRowAtIndexPath indexPath:IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style:.value1,reuseIdentifier:"reuseIdentifier")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.text="\(mydata.object(at: (indexPath as NSIndexPath).row))"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath:IndexPath) {
        print("You selected cell \(indexPath.row)!")
        let i =  indexPath.row
        let cellview=tableView.cellForRow(at: indexPath)
        if(i == 5){
            print("i love you!")
            let sb = UIStoryboard(name:"Main", bundle: nil)
            let vc1 = sb.instantiateViewController(withIdentifier: "login") as UIViewController
            self.present(vc1, animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let personal_button=UITabBarItem(title:"个人",image:UIImage(named:"个人.png"),tag:1)
        self.tabBarItem=personal_button
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
