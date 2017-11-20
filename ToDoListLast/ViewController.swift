//
//  ViewController.swift
//  ToDoListLast
//
//  Created by Maho Misumi on 2017/11/05.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

//疑問
//let todolist　みたいなTableViewに表示するデータの指定はどうやってやっているのか

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    @IBOutlet var todolistTable: UITableView!

//    todoItemというストリング型の変数を準備
    var todoItem = [String]()
//    最初の画面で起こること
    override func viewDidLoad() {
        super.viewDidLoad()
//        もしUserdefaultに入っている情報が空なら、変数todolistはUserDefaultsに保存されているものです
        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todo") as! [String]
        // Do any additional setup after loading the view, typically from a nib.
    }
    }
    //tableViewはtodoItemの数をカウントして表示してください
    func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return todoItem.count
    }
     //tableViewのセクションごとの行数を返してください
    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cellValue .textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }
//    もし編集してTodoltemの変数の中身を消すなら、Todoltemを取り除いてUserDefaultsの情報をセットしてもう一度読み込んでください
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todo")
            todolistTable.reloadData()
        }
    }
   // もしtodolistTableが空なら todolistTableを再度読み込んでください
    override func viewDidAppear(_ animated: Bool) {
        if todolistTable != nil {
        todolistTable.reloadData()
    }
    }
    
// ？？
     override   func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

