//
//  FirstViewController.swift
//  HelloWordWithSwift
//
//  Created by xpj on 2016/12/13.
//  Copyright © 2016年 com.xtendelife.HelloWordWithSwift. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func loadView() {
        let view = UINib(nibName: "FirstView", bundle: nil).instantiate(withOwner: self, options: nil).first
        if (view != nil) {
            self.view = view as! UIView!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn1Action(_ sender: UIButton) {
        self.performSegue(withIdentifier: "btn1Segue", sender: self)
    }

    @IBAction func btn2Action(_ sender: UIButton) {
        self.performSegue(withIdentifier: "btn2Segue", sender: self)
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
