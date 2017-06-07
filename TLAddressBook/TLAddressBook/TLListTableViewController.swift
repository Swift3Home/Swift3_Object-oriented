//
//  TLListTableViewController.swift
//  TLAddressBook
//
//  Created by lichuanjun on 2017/6/5.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class TLListTableViewController: UITableViewController {

    // 联系人数组
    var personList = [TLPerson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData { (list) in
            // print(list)
            // `拼接`数组，闭包中定义好的代码在需要的时候执行，需要self. 指定语境
            self.personList += list
            
            // 刷新表格
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 模拟异步，利用闭包回调
    private func loadData(completion: @escaping (_ list: [TLPerson]) -> ()) -> () {
        print("正在努力加载中...")
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0.5)
            
            var arrayPerson = [TLPerson]()
            for i in 0..<20 {
                let p = TLPerson()
                p.name = "zhangsan \(i)"
                p.phone = "1860" + String(format: "%06d", arc4random_uniform(1000000))
                p.title = "boss"
                
                arrayPerson.append(p)
            }
            
            // 主线程回调
            DispatchQueue.main.async (execute: {
                // 回调，执行闭包
                completion(arrayPerson)
                print("加载完成.")
            })
        }
    }
    
    @IBAction func addNewPerson(_ sender: Any) {
        // 执行segue 跳转界面
        performSegue(withIdentifier: "ListToDetail", sender: nil)
    }
    
    
    // MARK: - 控制器跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 类型转换 as
        // Swift 中 String 之外，绝大多数使用as 需要 ? / !
        // as! / as? 直接根据前面的返回值来决定
        // 注意：if let / guard let 判空语句，一律使用 as?
        let vc = segue.destination as! TLDetailTableViewController
        
        // 设置选中的 person, indexPath
        if let indexPath = sender as? IndexPath {
            // indexPath 一定有值
            vc.person = personList[indexPath.row]
            
            // 设置编辑完成的闭包
            vc.completionCallBack = {
                // 刷新指定行
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        } else {
            // 新建个人记录
            vc.completionCallBack = { [weak vc] in
                // 1. 获取明细控制器的 person
                guard let p = vc?.person else {
                    print("person 为nil")
                    return
                }
                
                // 2. 判断person的属性值是否为空串
                if p.name == "" || p.phone == "" || p.title == "" {
                    print("person 部分属性为空")
                    return
                }
                
                // 3. 插入到数据顶部
                self.personList.insert(p, at: 0)
                
                // 4. 刷新表格
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - 代理方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 执行segue
        performSegue(withIdentifier: "ListToDetail", sender: indexPath)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCellId", for: indexPath)

        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone

        return cell
    }
    

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
