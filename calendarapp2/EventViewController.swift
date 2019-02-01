//
//  EventViewController.swift
//  calendarapp2
//
//  Created by Kan Nakamura on 2019/01/27.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import UIKit
import RealmSwift


class EventViewController: UIViewController {

   
    @IBOutlet weak var CupOfBeer: UITextField!
    @IBOutlet weak var eventText: UITextView!
    @IBOutlet weak var y: UIDatePicker!
    @IBOutlet weak var y_text: UILabel!
    @IBOutlet weak var eventtext: UILabel!
    var whichisswitch = false
    @IBAction func HungoverSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            whichisswitch = true
            print(sender.isOn)    
        } else {
            whichisswitch = false
        }
    }
    @IBAction func Add(_ sender: Any) {
        //UIDatePickerからDateを取得する
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        y_text.text = formatter.string(from: y.date)
        eventtext.text = eventText.text
        
        //データ型の変換
        let beernumber = CupOfBeer.text
        let beernum = Int(beernumber!)!

        //データ書き込み
        print("データ書き込み開始")
        let realm = try! Realm()
        try! realm.write{
            //日付表示の内容とスケジュール入力の内容が書き込まれる。
            let Events = [Event(value: ["date": y_text.text, "event": eventText.text, "beer": beernum, "hungover": whichisswitch])]
            realm.add(Events)
            print("データ書き込み中")
        }
        print("データ書き込み完了")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
