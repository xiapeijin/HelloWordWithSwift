//
//  DemoTableViewController.swift
//  HelloWordWithSwift
//
//  Created by 夏培进 on 2016/12/13.
//  Copyright © 2016年 com.xtendelife.HelloWordWithSwift. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
    
    let style1CellIdentifier = "style1CellIdentifier"
    let style1CellName = "DemoStyle1TableViewCell"
    
    let style2CellIdentifier = "style2CellIdentifier"
    let style2CellName = "DemoStyle2TableViewCell"
    
    //画面显示数据
    var tableData: NSArray?
    
    override func loadView() {
        let view = UINib(nibName: "DemoTableView", bundle: nil).instantiate(withOwner: self, options: nil).first
        if (view != nil) {
            self.view = view as! UIView!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registCells
        registCells()
        
        //获取画面数据
        initTableData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 获取画面数据
    func initTableData() {
        //mock data
        tableData = [(name: "jack", comment: "i am jack, hello! ", img: "01"),
                     (name: "marye", comment: "i am marye, hello! ", img: "02"),
                     (name: "salinna", comment: "i am salinna, hello! ", img: "03"),
                     (name: "duck", comment: "i am duck, hello! ", img: "04"),
                     (name: "mande", comment: "i am mande, hello! ", img: "05"),
                     (name: "kuri", comment: "i am kuri, hello! ", img: "06"),
                     (name: "swana", comment: "i am swana, hello! ", img: "07"),
                     (name: "kukuda", comment: "i am kukuda, hello! ", img: "08"),
                    ]
    }
    
    // MARK: - 注册Cells
    func registCells() {
        let style1Cell = UINib(nibName: style1CellName, bundle: nil)
        self.tableView.register(style1Cell, forCellReuseIdentifier: style1CellIdentifier)
        
        let style2Cell = UINib(nibName: style2CellName, bundle: nil)
        self.tableView.register(style2Cell, forCellReuseIdentifier: style2CellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (tableData?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: Int = indexPath.row
        if index % 2 == 0 {
            let cell: DemoStyle1TableViewCell = tableView.dequeueReusableCell(withIdentifier: style1CellIdentifier, for: indexPath) as! DemoStyle1TableViewCell
            cell.item = tableData![index] as! (name: String, comment: String, img: String)
            return cell;
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: style2CellIdentifier, for: indexPath) as! DemoStyle2TableViewCell
            cell.item = tableData![index] as! (name: String, comment: String, img: String)
            return cell;
        }
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
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
