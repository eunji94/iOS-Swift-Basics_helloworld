//
//  MeetingRoomListViewController.swift
//  MeetingRooms
//
//  Created by eunjikim on 2017. 10. 16..
//  Copyright © 2017년 eunjikim. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {
    //var meetingRooms:[String:[String:Int]] = ["Meeting":["Bansky":4, "Rivera":8, "Kahlo":8, "Picasso":10], "Seminar":["Cezanne":20, "Matisse":30, "Renoir":40]]
    var service:Service?
    
    /*
    func meetingRoomsAtIndex(index:Int) -> (key:String, value:[String:Int]) {
        let orderedMeetringRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        return orderedMeetringRooms[index]
    }
 */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = service?.name
        self.navigationController?.isToolbarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let categoryValues = Array(meetingRooms.values)[section]
        //let orderedMeetringRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        //let rowCount = meetingRoomsAtIndex(index: section).value.count
        guard let rowCount = service?.items?.count else {
            return 0
        }
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        //let orderedMeetringRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        //let categoryValue = orderedMeetringRooms[indexPath.section].1
        //let categoryValue = meetingRoomsAtIndex(index: indexPath.section).value
        //let categoryValue = Array(meetingRooms.values)[indexPath.section]
        //let orderedCategoryValue = categoryValue.sorted(by:{$0.1 < $1.1})
        
//        let roomName = Array(categoryValue.keys)[indexPath.row]
//        let capacity = Array(categoryValue.values)[indexPath.row]
        //let roomName = orderedCategoryValue[indexPath.row].0
        //let capacity = orderedCategoryValue[indexPath.row].1
        
        guard let meetingRoom = service?.items?[indexPath.row] else {
            return cell
        }
        
        cell.textLabel!.text = meetingRoom.name
        cell.detailTextLabel!.text = String(meetingRoom.capacity)
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //let orderedMeetringRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        //return Array(meetingRooms.keys)[section]
        return meetingRoomsAtIndex(index: section).key
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //let orderedMeetringRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        //let rowCount = Array(meetingRooms.values)[section].count
        let rowCount = meetingRoomsAtIndex(index: section).value.count
        return "\(rowCount) rooms"
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReservationSegue" {
            guard let destination = segue.destination as? ReservationListViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let meetingRoom = service?.items?[selectedIndex] else {
                return
            }
            destination.meetingRoom = meetingRoom
        }
    }
    

}
