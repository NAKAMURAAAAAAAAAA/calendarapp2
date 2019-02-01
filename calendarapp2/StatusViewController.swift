//
//  StatusViewController.swift
//  calendarapp2
//
//  Created by Kan Nakamura on 2019/02/01.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import UIKit
import RealmSwift


class StatusViewController: UIViewController {

    @IBOutlet weak var numberofcup: UILabel!
    
    @IBAction func button(_ sender: Any) {
        let realm = try! Realm()
        let result = realm.objects(Event.self).filter("hungover == true")
        //ここでString型のdateと一致させている。
        print(result.count)
        var sum = 0
        for res in result{
            sum += res.beer
        }
        numberofcup.text = "\(sum / result.count)"
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
