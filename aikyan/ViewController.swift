
//
//  ViewController.swift
//  aikyan
//
//  Created by N.Rozetta on 2016/06/11.
//  Copyright (c) 2016年 N.Rozetta. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = NSUserDefaults.standardUserDefaults().stringArrayForKey("items"){
            self.items = items
            //} else {
            //    self.items = []
        }
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action:Selector("pushAddButton:"))
    }
    
    func pushAddButton(sender: UIBarButtonItem) {
        //items.append("NEW THINGS")
        
        //ダイアログを作る
        let alert = UIAlertController(title: "えみつん", message: nil, preferredStyle: .Alert)
        
        //テキスト入力欄を作る
        alert.addTextFieldWithConfigurationHandler{ textField in
            //プレースホルダー
            textField.placeholder = "タスク名を追加"
        }
        
        //OKボタンを追加
        alert.addAction(UIAlertAction(title: "Okay", style: .Default ,handler: { action in
            //OK押された時の処理
            
            if let textF: UITextField = (alert.textFields?.first)! as
                UITextField {
                
                if let text = textF.text {
                    // 追加する処理
                    self.items.append(text)
                    self.tableView.reloadData()
                    //追加した動きの保存
                    let userdefaults = NSUserDefaults.standardUserDefaults()
                    
                    userdefaults.setObject(self.items, forKey: "items")
                    
                }
            }
        }))
        
        // キャンセルボタンを追加
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel,handler: nil))
        
        // アラートを表示する
        presentViewController(alert, animated: true, completion:nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Rlow", forIndexPath:indexPath)
        
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
        
        //全部消す奴
        //items.removeAll()
        //tableView.reloadData()
        
        //delete を押したところの場所
        let index = indexPath.row
        print(index)
        
        tableView.beginUpdates()
        
        items.removeAtIndex(index)
        //削除した動きの保存
        let userdefaults = NSUserDefaults.standardUserDefaults()
        
        userdefaults.setObject(self.items, forKey: "items")
        let indexPaths = NSIndexPath(forRow: indexPath.row, inSection:indexPath.section)
        tableView.deleteRowsAtIndexPaths([indexPaths],withRowAnimation: .Fade)
        
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = Map1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}