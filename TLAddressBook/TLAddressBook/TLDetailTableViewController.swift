//
//  TLDetailTableViewController.swift
//  TLAddressBook
//
//  Created by lichuanjun on 2017/6/5.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class TLDetailTableViewController: UITableViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    var person: TLPerson?
    //完成回调属性
    // 闭包的返回值是可选的
    // var completionCallBack: () -> ()?
    // 闭包是可选的
    var completionCallBack: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 是否person有值，如果有设置UI
        if person != nil {
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
        
        // 激活按钮
        textChange((Any).self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textChange(_ sender: Any) {
        // 如果两个输入框都有内容，才允许保存
        navigationItem.rightBarButtonItem?.isEnabled = nameText.hasText && phoneText.hasText && titleText.hasText
    }
    
    
    @IBAction func savePerson(_ sender: Any) {
        
        // 1. 判断 person 是否有值，如果有值，就设置 UI
        if person == nil {
            person = TLPerson()
        }
        
        // 2. 用UI更新person的内容
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        
        // 3. 执行闭包回调
        // OC 中执行block前都必须判断是否有值，否则容易崩溃
        // !：强行解包(Xcode 帮助修订，一定不要用)
        // ?：可选解包(如果为nil，就什么也不做)
        completionCallBack?()
        
        // 4. 返回上一级界面
        //
        // 方法的返回值没有使用
        // _ 可以忽略一切不关心的内容
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
