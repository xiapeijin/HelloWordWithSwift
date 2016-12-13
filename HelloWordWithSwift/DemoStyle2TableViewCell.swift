//
//  Style2TableViewCell.swift
//  HelloWordWithSwift
//
//  Created by 夏培进 on 2016/12/13.
//  Copyright © 2016年 com.xtendelife.HelloWordWithSwift. All rights reserved.
//

import UIKit

class DemoStyle2TableViewCell: UITableViewCell {

    
    @IBOutlet var headerImg: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var commentLabel: UILabel!
    var itemCopy: (name: String, comment: String, img: String)?
    
    var item: (name: String, comment: String, img: String){
        get{
            return self.itemCopy!
        }
        set{
            //            print(newValue)
            self.itemCopy = newValue
            self.headerImg.image = UIImage(named: newValue.img)
            self.nameLabel.text = newValue.name
            self.commentLabel.text = newValue.comment
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
