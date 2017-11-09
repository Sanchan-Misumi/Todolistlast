//
//  ViewController.swift
//  ToDoListLast
//
//  Created by Maho Misumi on 2017/11/05.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    @IBOutlet var todolistTable: UITableView!

    var todoItem = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todo") as! [String]
        // Do any additional setup after loading the view, typically from a nib.
    }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return todoItem.count
    }
    
    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cellValue .textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todo")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if todolistTable != nil {
        todolistTable.reloadData()
    }
    }
    

     override   func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

