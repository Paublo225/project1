//
//  HomeActions.swift
//  Runner
//
//  Created by  Paul on 28/04/2020.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter
import HomeKit
import Foundation
import CoreLocation
import MapKit

@available(iOS 11.0, *)
class HomeData: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as UITableViewCell
        
        let action = actions[indexPath.row] as! HMCharacteristicWriteAction<NSCopying>
        
       
            cell.textLabel?.text = action.characteristic.characteristicType
    
        return cell
}
    
    
    @IBOutlet weak var actionsTableView: UITableView!
    
    weak var currentActionSet:HMActionSet?
    
    var actions = [HMActionSet]()
    var homeManager = HMHomeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentActionSet = currentActionSet {
            self.title = "\(currentActionSet.name)"
        }
    }
    
    func getHomes(result: FlutterResult) {
        guard let primaryHome: HMHome = self.homeManager.primaryHome else {
            result("Nothing")
            return
        }
        result("\(primaryHome.name)")
        
    }
    
    
    
    
  
    
func getActionList(result: FlutterResult) {
        let home = homeManager.primaryHome
       let listAct = (home?.actionSets) ?? Array<HMActionSet>()
        var actlist = [String]()
        var i: Int = 0
      for listAct in listAct {
        
        print(listAct.name)
        }
        
        guard listAct != nil else {
            result(FlutterError(code: MyFlutterErrorCode.unavailable,
                                message: "Actions info unavailable",
                                details: nil))
            return
        }
        
        
        for listAct in listAct{
            i+=1
            actlist.append(listAct.name)
           print(actlist)
           
            
        }
        print(actlist)
        result(actlist)
        
    
    }

    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }
    
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     weak var pendingTrigger:HMTimerTrigger?
          
          weak var datePicker: UIDatePicker!
          weak var nameField: UITextField!
           weak var repeatSwitch: UISwitch!
           weak var repeatDaily: UISwitch!
    var currentTrigger = [HMTrigger]()
    
  
 
 
    func createNewTrigger(name:String, weekdays:NSNumber, hour:Int?, minute:Int?, result:FlutterResult) {
        var dateComp = DateComponents()
        dateComp.hour = hour
        dateComp.minute = minute
         var weekD = [DateComponents]()
        for weekdays in 1...7 {
       var recurrence = DateComponents()
        recurrence.weekday = weekdays
        weekD.append(recurrence)
        }
        let calendarEvent = HMCalendarEvent(fire: dateComp)
        let trigger = HMEventTrigger(name: name, events: [calendarEvent], end: nil, recurrences: weekD, predicate: nil)
        result(trigger)
         
       }
    
  /*  func addTrigger(_ trigger: HMTrigger, completionHandler completion: @escaping (Error?) -> Void) {
        
    }*/
    
    func triggerlist(result:FlutterResult) {
        let home = homeManager.primaryHome
        let triger = (home?.triggers) ?? Array<HMTrigger>()
        var triggerlistcomp = [String]()
        guard triger != nil else {
            result("No triggers")
            return
        }
        for triger in triger {
            print(triger.name)
            triggerlistcomp.append(triger.name)
        }
        result(triggerlistcomp)
    }
    
    
    
    
    
    
    
  
    func updateTriggers (result:FlutterResult) {
        
        var triggers = [HMTrigger]()
       if let currentHome = self.homeManager.primaryHome {
               triggers += currentHome.triggers as [HMTrigger]
           }
        for triggers in triggers {
            print(triggers.name)
        result(triggers.name)
        }
       }

    
    
    
    
    
    
    
  /*  @available(iOS 11.0, *)
    func createTrigger(result:FlutterResult){
        var dateComponents = DateComponents()
        dateComponents.hour = 17
        dateComponents.minute = 30
        let calendarEvent = HMCalendarEvent(fire: dateComponents)
        let eventTrigger = HMEventTrigger(name: "Every day at 5:30PM", events: [calendarEvent],predicate: nil)
        let sunriseEvent = HMSignificantTimeEvent(significantEvent: HMSignificantEvent.sunrise, offset: nil)
        var weekdays = [DateComponents]()
        for weekday in 2...5 {
        var recurrence = DateComponents()
        recurrence.weekday = weekday
        weekdays.append(recurrence)
        }
        let eventsTrigger = HMEventTrigger(name: "Sunrise, Daily",
        events: [sunriseEvent], end: nil,
        recurrences: weekdays, predicate: nil)
    }
    
    
    
    */
    
    
    
    
    
    
    
   /* func saveTrigger() {
    if let pendingTrigger = pendingTrigger {
        let triggerName = self.nameField.text!
        let calendar = NSCalendar.current
    let selectedDate = self.datePicker.date
    var recurrenceComp:NSDateComponents?
        if repeatSwitch.isOn || repeatDaily.isOn {
    recurrenceComp = NSDateComponents()
            if repeatSwitch.isOn {
    recurrenceComp?.minute = 5
    }
            if repeatDaily.isOn {
    recurrenceComp?.day = 1
    }
    }
        pendingTrigger.updateRecurrence(recurrenceComp as DateComponents?) {
    error in
    if error != nil {
    NSLog("Failed updating recurrence, error:\(error)")
    }
    }
    pendingTrigger.updateName(triggerName) {
    error in
    if error != nil {
    NSLog("Failed updating fire date, error:\(error)")
    }
    }
    
    }
    else {
        if let currentHome = self.homeManager.primaryHome{
            guard let triggerName = self.nameField.text else { return  }
        let calendar = NSCalendar.current
        let selectedDate = self.datePicker.date
            let dateComp = calendar.component(.hour, from: selectedDate)
    let fireDate = calendar.dateComponents([.minute, .hour], from: selectedDate)

    var recurrenceComp:NSDateComponents?
        if repeatSwitch.isOn || repeatDaily.isOn {
    recurrenceComp = NSDateComponents()
            if repeatSwitch.isOn {
    recurrenceComp?.minute = 5
    }
            if repeatDaily.isOn {
    recurrenceComp?.day = 1
    }
    }
            let trigger = HMTimerTrigger(name: triggerName ?? , fireDate: selectedDate, timeZone: nil, recurrence: recurrenceComp as DateComponents?, recurrenceCalendar: nil)
    
    }
    }
    }*/
    }
   


