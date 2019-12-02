//
//  Devices+CoreDataProperties.swift
//  CoreData2
//
//  Created by Noman Yousuf on 11/3/19.
//  Copyright © 2019 colors. All rights reserved.
//
//

import Foundation
import CoreData


extension Devices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Devices> {
        return NSFetchRequest<Devices>(entityName: "Devices")
    }

    @NSManaged public var name: String?
    @NSManaged public var manufacturer: String?
    @NSManaged public var model: String?

}
