//
//  ViewController.swift
//  calendarapp2
//
//  Created by Kan Nakamura on 2019/01/27.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//
import UIKit
import FSCalendar
import CalculateCalendarLogic
import RealmSwift

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance  {
    
    @IBOutlet weak var whichishungover: UILabel!
    @IBOutlet weak var cupofbeer: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelEvent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        /*let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
         let day = tmpDate.component(.day, from: date)*/
        //labelに日程表示

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let da = formatter.string(from: date)
        labelDate.text = da
        
        //スケジュール取得
        let realm = try! Realm()
        let result = realm.objects(Event.self).filter("date = '\(da)'")
        //ここでString型のdateと一致させている。
        
        print(result)
        
        labelEvent.text = "イベントはありません"
        whichishungover.text = ""
        cupofbeer.text = ""
        for ev in result {
            if ev.date == da {
                labelEvent.text = ev.event
                cupofbeer.text = "\(ev.beer)"
                if ev.hungover == true{
                    whichishungover.text = "二日酔い"
                }else{
                    whichishungover.text = "適正飲酒"
                }
            }
        }
        
    }
    
}
