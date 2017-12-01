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

    //todoItemというストリング型の変数を準備
    var todoItem : [String]!
    
    //押されたセルのindexPathを保存する
    var numberIndex : Int!

//画面が表示する前の一番最初の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        もしUserdefaultに入っている情報が空なら、変数todolistはUserDefaultsに保存されているものです
//        if UserDefaults.standard.object(forKey: "todo") != nil {
//            todoItem = UserDefaults.standard.object(forKey: "todo") as! [String]
        if UserDefaults.standard.object(forKey: "todo") != nil {
            todoItem = UserDefaults.standard.array(forKey: "todo") as! [String]
        }else{
            todoItem = [""]
        }
        
        todolistTable.delegate = self
        todolistTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = todoItem[indexPath.row]
        return cell!
    }
    
    //セルがタップされた時の処理をdelegateメソッドを利用して実装
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        numberIndex = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: nil)
    }
    
    //画面遷移時の設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let editViewController = segue.destination as! EditViewController
            editViewController.editViewNumberIndex = self.numberIndex
        }
    }

    
}



