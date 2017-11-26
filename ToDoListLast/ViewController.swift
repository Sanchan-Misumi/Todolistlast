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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var todolistTable: UITableView!

//    todoItemというストリング型の変数を準備
    var todoItem = [String]()
//画面が表示する前の一番最初の処理
    override func viewDidLoad() {
        super.viewDidLoad()
////        もしUserdefaultに入っている情報が空なら、変数todolistはUserDefaultsに保存されているものです
//        if UserDefaults.standard.object(forKey: "todo") != nil {
//            todoItem = UserDefaults.standard.object(forKey: "todo") as! [String]
//        // Do any additional setup after loading the view, typically from a nib.
        todolistTable.delegate = self
        todolistTable.dataSource = self
        
            todoItem.append("Apple")
         todoItem.append("Banana")
        print(todoItem)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = todoItem[indexPath.row]
        return cell!
    }

//    //toDoItemの数をカウントしてそれをnumberOfRowsInSectionに返す
//    func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
//        return todoItem.count
//    }
//     //tableViewのセクションごとの行数を返してください
//    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
//        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cellValue .textLabel?.text = todoItem[indexPath.row]
//        return cellValue
//    }
////    //削除用
////    もし編集してTodoltemの変数の中身を消すなら、Todoltemを取り除いてUserDefaultsの情報をセットしてもう一度読み込んでください
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
//        if editingStyle == UITableViewCellEditingStyle.delete{
//            todoItem.remove(at: indexPath.row)
//            UserDefaults.standard.set(todoItem, forKey: "todo")
//            todolistTable.reloadData()
//        }
//    }
//   // 画面が表示された直後にtodolistTableが空なら todolistTableを再度読み込んでください
//    override func viewDidAppear(_ animated: Bool) {
//        if todolistTable != nil {
//        todolistTable.reloadData()
//    }
//    }
}



