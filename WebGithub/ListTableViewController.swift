//
//  ListTableViewController.swift
//  WebGithub
//
//  Created by Kisacka on 16/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var skillsList = [
        "https://github.com/ilzekalnina/ShoppingList",
        "https://github.com/ilzekalnina/LoginApp",
        "https://github.com/ilzekalnina/MovieMusicAppTabBar",
        "https://github.com/ilzekalnina/MovieList",
        "https://github.com/ilzekalnina/LifeCycle",
        "https://github.com/ilzekalnina/ConverterTemperature",
        "https://github.com/ilzekalnina/WeeklyDayFinder",
        "https://github.com/ilzekalnina/UIElementsLayout",
        "https://github.com/ilzekalnina/DarkModeApp"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return skillsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "webCell", for: indexPath)

        cell.textLabel?.text = skillsList[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Main because Main storyboard, it is showed at the beginning when creating project, in the same window, where is possible to choose Ipad, portrait, landscape etc.
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: WebViewController = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.passedValue = skillsList[indexPath.row]
        self.present(vc, animated: true)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

 

}
