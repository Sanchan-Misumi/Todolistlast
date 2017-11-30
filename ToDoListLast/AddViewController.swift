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
    
  

    //UITextField!使います
    @IBOutlet var todoTextField: UITextField!
    
    //倉庫を作ってそこにデータ保存します
    let saveDate: UserDefaults = UserDefaults.standard

    
    //addItemを押した時にUserDefaultsにデータを保存します
    @IBAction func addItem(){
        todoItem.append(todoTextField.text!)
        saveDate.set(todoItem, forKey: "Todo")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTextField.text = saveDate.object(forKey: "Todo") as? String
        todoTextField.delegate = self as? UITextFieldDelegate
        saveDate.set(todoItem, forKey: "Todo")as? [String]
        
        // Do any additional setup after loading the view.
    }

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
