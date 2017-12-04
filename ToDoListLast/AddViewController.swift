//
//  AddViewController.swift
//  ToDoListLast
//
//  Created by Maho Misumi on 2017/11/27.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit


class AddViewController: UIViewController {
    
    //ToDoItemという変数を用意します
    var todoItem = [String]()
    
    //倉庫を作ってそこにデータ保存します
    let saveDate: UserDefaults = UserDefaults.standard
    
    //UITextField!使います
    @IBOutlet var todoTextField: UITextField!
    
    //この画面を開くときにする動作
    override func viewDidLoad() {
        super.viewDidLoad()
          // Do any additional setup after loading the view.
        //もしUserDefaultsのforKey: "Todo"の中身が空ではなければ、変数todoItemにUserDefaultsのforKey: "Todoの中の配列の中身を代入します
        if UserDefaults.standard.array(forKey: "Todo") != nil{
            todoItem = UserDefaults.standard.array(forKey: "Todo") as! [String]
        }
    }
    
    //addItemを押した時にUserDefaultsにデータを保存します
    @IBAction func addItem(){
        //変数todoItemの中にtodoTextFieldに書いたテキストを追加します
        todoItem.append(todoTextField.text!)
         //変数todoItemの中身を UserDefaultsに保存します
        saveDate.set(todoItem, forKey: "Todo")
        //todoItemの中身をコンソールに代入します
        print(todoItem)
    }
     //
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        todoTextField.resignFirstResponder()
        return true
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
