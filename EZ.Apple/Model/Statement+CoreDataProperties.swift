//
//  Statement+CoreDataProperties.swift
//  EZ.Apple
//
//  Created by YouiHyon Kim on 2023/05/08.
//
//

import Foundation
import CoreData


extension Statement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Statement> {
        return NSFetchRequest<Statement>(entityName: "Statement")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var state_number: String?
    @NSManaged public var state_message: String?
    @NSManaged public var state_image: String?
    @NSManaged public var state_description: String?
    @NSManaged public var created_at: Date?
    @NSManaged public var date_format: String?

}

extension Statement : Identifiable {

}
