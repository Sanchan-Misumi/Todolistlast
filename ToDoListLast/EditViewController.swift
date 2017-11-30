//
//  EditViewController.swift
//  ToDoListLast
//
//  Created by YAMAMOTORYO on 2017/11/28.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var editViewNumberIndex : Int = 0

    @IBOutlet weak var editTextField: UITextField!
    
    var saveData = UserDefaults.standard
    var todoItem : [String]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let array = saveData.array(forKey: "todo")  else {
            print("todoUserDefaults isn't EXIST!")
            return
        }
        
        
        todoItem = array as! [String]
        editTextField.text = todoItem[editViewNumberIndex]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editItem() {
        todoItem[editViewNumberIndex] = editTextField.text!

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
