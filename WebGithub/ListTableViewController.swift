//
//  ListTableViewController.swift
//  WebGithub
//
//  Created by Kisacka on 16/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit
import CoreData

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
    
    var context: NSManagedObjectContext?
    var links = [Webpage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext

    }
    
    
    @IBAction func addNewProjectTapped(_ sender: Any) {
        addNewGithubProject()
    }
    
    func addNewGithubProject(){
        //alert window
        let alertController = UIAlertController(title: "New Github project!", message: "What would you like to add?", preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField) in
            //Text below will be shown in the field, where to write address
            textField.placeholder = "Enter the link of your Github project"
 
        }
        //add button
        let addAction = UIAlertAction(title: "Add", style: .cancel) { (action: UIAlertAction) in
            
            
            let textField = alertController.textFields?.first
            
            
            let entity = NSEntityDescription.entity(forEntityName: "Webpage", in: self.context!)
            let link = NSManagedObject(entity: entity!, insertInto: self.context)
            link.setValue(textField?.text, forKey: "internetAddress")
            
 
            self.saveData()

            
        }
        //end addAction
        
        //cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    //MARK:-Func for CoreData - save, load
    //#warning some trouble there - if uncomented, then it shows up as yellow
    
    //to reload table view
    func loadData(){
        let request: NSFetchRequest<Webpage> = Webpage.fetchRequest()
        do{
            let result = try context?.fetch(request)
            links = result!
            
        } catch {
            fatalError(error.localizedDescription)
        }
        tableView.reloadData()
        
    }
    

    
    func saveData(){
        do {
            //saving new link
            try self.context?.save()            }
        catch{
            fatalError(error.localizedDescription)
        }
        self.loadData()
    }

    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //previously was
        //return skillsList.count
        return links.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "webCell", for: indexPath)
        //previously was
       // cell.textLabel?.text = skillsList[indexPath.row]
        let skill = links[indexPath.row]
        cell.textLabel?.text = skill.value(forKey: "internetAddress") as? String
        
        cell.selectionStyle = .none
        
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Main because Main storyboard, it is showed at the beginning when creating project, in the same window, where is possible to choose Ipad, portrait, landscape etc.
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: WebViewController = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        //previously was
       // vc.passedValue = skillsList[indexPath.row]
        vc.passedValue = links[indexPath.row]
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
