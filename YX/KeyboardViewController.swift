//
//  KeyboardViewController.swift
//  YX
//
//  Created by IOS Developer on 16/9/8.
//  Copyright © 2016年 Shaun. All rights reserved.
//

import UIKit


let SCREENWIDTH = UIScreen.mainScreen().bounds.width
let SCREENHEIGHT = UIScreen.mainScreen().bounds.height


class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    
 
    func createButtons(titles: [String]) -> [UIButton] {
    
    var buttons = [UIButton]()
    
    for title in titles {
        let button = UIButton(type: UIButtonType.Custom)
        button.setTitle(title, forState: .Normal)
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        button.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        button.addTarget(self, action: #selector(KeyboardViewController.keyPressed(_:)), forControlEvents: .TouchUpInside)
        buttons.append(button)
        
        }
    return buttons
    }
    
    func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        (textDocumentProxy as UIKeyInput).insertText(title!)
    }
    func keyboardDelete(sender: AnyObject?) {
//        let delete = sender as! UIButton
        
        (textDocumentProxy as UIKeyInput).deleteBackward()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let buttonTitles = ["😀", "👎", "😒", "🙄", "😢", "👏","😂","😞","💋","🌹"]
        let buttons = createButtons(buttonTitles)
        let topRow = UIView(frame: CGRectMake(0, 0, SCREENWIDTH, 40))
        
        let deleteBtn = UIButton(frame: CGRect(x: SCREENWIDTH - 50, y: 180,width: 30,height: 30))
        deleteBtn.addTarget(self, action: #selector(keyboardDelete), forControlEvents: UIControlEvents.TouchUpInside)
        deleteBtn.setTitle("X", forState: UIControlState.Normal)
        
        self.view.addSubview(deleteBtn)
        
        topRow.backgroundColor = UIColor.redColor()
        self.view.addSubview(topRow)
        
        let btnW = SCREENWIDTH / CGFloat( buttons.count)
        
        for ( idx, button) in buttons.enumerate() {
            
            button.frame = CGRect(x: btnW * CGFloat( idx ), y: 0, width: btnW, height: 40)
            topRow.addSubview(button)
        }
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
