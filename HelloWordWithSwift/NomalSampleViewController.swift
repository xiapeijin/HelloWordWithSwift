//
//  NomalSampleViewController.swift
//  HelloWordWithSwift
//
//  Created by 夏培进 on 2016/12/12.
//  Copyright © 2016年 com.xtendelife.HelloWordWithSwift. All rights reserved.
//

import UIKit

class NomalSampleViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var sexSegment: UISegmentedControl!
    
    @IBOutlet var commentText: UITextField!
    @IBOutlet var privateSwitch: UISwitch!
    @IBOutlet var commitBtn: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        initViewStyle()
        //注册键盘的notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: .UIKeyboardWillChangeFrame, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //取消注册键盘的notification
        NotificationCenter.default.removeObserver(self)
    }
    func initViewStyle() {
        
        //set some view style in this place
        
        //commitBtn
        commitBtn.layer.borderWidth = 1
        commitBtn.layer.borderColor = UIColor.blue.cgColor
        commitBtn.layer.cornerRadius = 3
    }
    
    // 防止二次提交
    @IBAction func commitAction(_ sender: UIButton) {
        
        print(NSDate.timeIntervalSinceReferenceDate)
        
        // 取消延时调用
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(doCommitAction), object: nil)
        // 延时调用
        /*
         1.5 秒后自动调用 self 的 doCommitAction 方法
         */
        self.perform(#selector(doCommitAction), with: nil, afterDelay: 1.5)
    }
    
    @objc private func doCommitAction() {
        print(NSDate.timeIntervalSinceReferenceDate)
    }
    //键盘的退出处理
    @IBAction func tapViewAction(_ sender: UIControl) {
        commentText.resignFirstResponder()
        
    }

    //在键盘的notification方法中改变约束
    func keyboardWillChange(_ notification: Notification){
        
        if let userInfo = notification.userInfo,
            let value = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt {
            
            let frame = value.cgRectValue
            let intersection = frame.intersection(self.view.frame)
            //self.view.setNeedsLayout()
            //改变下约束
            self.bottomConstraint.constant = intersection.height + 30
            
            UIView.animate(withDuration: duration, delay: 0.0,
                           options: UIViewAnimationOptions(rawValue: curve), animations: {
                            _ in
                            self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
