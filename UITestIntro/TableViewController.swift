//
//  TableViewController.swift
//  UITestIntro
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var list: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

    
    func getData(){
        let url = URL(string: "https://demo.ckan.org/api/3/action/group_list")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if let data = data {
                do {
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    dump(jsonSerialized)
                    self.list = jsonSerialized!["result"] as! [String]
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }  else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
