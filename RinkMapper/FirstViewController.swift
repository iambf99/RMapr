//
//  FirstViewController.swift
//  RinkMapper
//
//  Created by Brent Fowles on 2016-07-12.
//  Copyright © 2016 Brent Fowles. All rights reserved.
//

import UIKit

var prevSearches = [String]()


class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var userSearched: UITextField!
    @IBOutlet weak var previousSearches: UITableView!
    
    
    @IBAction func findRinks(_ sender: AnyObject) {
        prevSearches.append(userSearched.text!)
        
        userSearched.text = ""
        UserDefaults.standard.set(prevSearches, forKey: "prevSearches")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        if UserDefaults.standard.object(forKey: "prevSearches") != nil {
            prevSearches = UserDefaults.standard.object(forKey: "prevSearches") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prevSearches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = prevSearches[(indexPath as NSIndexPath).row]
        
        return cell
    }

    override func viewDidAppear(_ animated: Bool) {
        previousSearches.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        userSearched.resignFirstResponder()
        return true
    }
    
}

