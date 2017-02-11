//
//  Map1ViewController.swift
//  aikyan
//
//  Created by N.Rozetta on 2016/11/19.
//  Copyright © 2016年 N.Rozetta. All rights reserved.
//

import UIKit

class Item{
    let title: String
    let category: String
    let price: Int
    
    init(title: String, category: String, price: Int) {
        self.title = title
        self.category = category
        self.price = price
    }
}

class Map1ViewController: UITableViewController {
    
    var items = [
        Item(title: "なんちゃら",category: "ライブ",price: 2000),
        Item(title: "かんちゃら",category: "飯",price: 4000)
    ]
    
    
    init() {
        super.init(style: .Grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            // なんこ？ return ?
            return 1
        } else {
            // なんこ？
            return items.count
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath)
            
            
            cell.textLabel?.text = "6000"
            
            return cell as! UITableViewCell
            // return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath)
            
            cell.textLabel?.text = items[indexPath.row].title
            cell.detailTextLabel?.text = "\(items[indexPath.row].price)"
            
            return cell as! UITableViewCell
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"cell")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
