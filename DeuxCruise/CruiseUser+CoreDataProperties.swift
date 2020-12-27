//
//  CruiseUser+CoreDataProperties.swift
//  
//
//  Created by Ibukunoluwa Soyebo on 27/12/2020.
//
//

import Foundation
import CoreData


extension CruiseUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CruiseUser> {
        return NSFetchRequest<CruiseUser>(entityName: "CruiseUser")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}
