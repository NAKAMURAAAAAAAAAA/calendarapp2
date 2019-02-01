//
//  Event.swift
//  calendarapp2
//
//  Created by Kan Nakamura on 2019/01/27.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//
import Foundation
import RealmSwift

class Event: Object {
    
    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""
    @objc dynamic var beer: Int = 0
    @objc dynamic var highball: Int = 0
    @objc dynamic var hungover: Bool = false
    
    
}
