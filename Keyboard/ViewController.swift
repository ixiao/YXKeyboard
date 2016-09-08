//
//  ViewController.swift
//  Keyboard
//
//  Created by IOS Developer on 16/9/8.
//  Copyright © 2016年 Shaun. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.mainScreen().bounds.width

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showLab = UILabel(frame: CGRect(x: 20, y: 200, width: SCREENWIDTH-40, height: 30))
        showLab.font = UIFont.systemFontOfSize(30)
        showLab.text = "自定义键盘"
        showLab.textAlignment = NSTextAlignment.Center
        showLab.textColor = UIColor.whiteColor()
        
        let textf = UITextField(frame: CGRect(x: 20, y: 250, width: SCREENWIDTH-40, height: 30))
        textf.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(textf)
        
        
        self.view.addSubview(showLab)
        
        self.view.backgroundColor = UIColor.blackColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

