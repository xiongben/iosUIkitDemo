//
//  Student+CoreDataProperties.swift
//  TumMenuDemo
//
//  Created by admin on 2022/8/8.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var height: Double

}

extension Student : Identifiable {

}
