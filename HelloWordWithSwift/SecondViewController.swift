//
//  SecondViewController.swift
//  HelloWordWithSwift
//
//  Created by xpj on 2016/12/13.
//  Copyright © 2016年 com.xtendelife.HelloWordWithSwift. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var labelBackgroundColor: UIColor!// UIColor(red: 240.0/255, green: 118.0/255, blue: 101.0/255, alpha: 1.0)
    
    
    override func loadView() {
        let view = UINib(nibName: "SecondView", bundle: nil).instantiate(withOwner: self, options: nil).first
        if (view != nil) {
            self.view = view as! UIView!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.backgroundColor = labelBackgroundColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
