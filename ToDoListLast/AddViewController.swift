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
    var todoItem = Array<String>()
    

    //UITextField!使います
    @IBOutlet var todoTextField: UITextField!
    
    //倉庫を作ってそこにデータ保存します
    let saveDate: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //これなにやっているの？？
//        todoTextField.text = saveDate.object(forKey: "Todo") as? String
        
        todoTextField.delegate = self as? UITextFieldDelegate
        
        //todoItemをUserDefaultsから呼び出す
        //呼び出しただけでは、配列になっている
        if saveDate.object(forKey: "todo") != nil {
            todoItem = UserDefaults.standard.array(forKey: "todo") as! [String]
        }
//        else{
//            //todoItemがnullになって落ちないように、UserDefaultsの"todo"に値が存在しない時は初期値を代入
//            print("todoItem初期化！！")
//            todoItem = ["Apple", "Banana", "Cascade"]
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //addItemを押した時にUserDefaultsにデータを保存します
    @IBAction func addItem(){
        //todoItem配列に新しい情報を追加
        if todoTextField.text == "" {
            print("入力なし")
            return
        }
        todoItem.append(todoTextField.text!)
        print("item = " + todoTextField.text!)
//        guard let item = todoTextField.text else {
//            print("TextField = nil")
//            return
//        }
//        print("item = " + String(item))
//        todoItem.append(item)
        
        //UserDefaultsに保存
        saveDate.set(todoItem, forKey: "todo")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
        todoTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
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
