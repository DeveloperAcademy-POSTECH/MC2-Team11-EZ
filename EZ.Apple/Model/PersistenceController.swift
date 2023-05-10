//
//  persistenceController.swift
//  EZ.Apple
//
//  Created by YouiHyon Kim on 2023/05/08.
//

import UIKit
import CoreData

class PersistenceController {
    static let coreDm = PersistenceController()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var statementEntity: NSEntityDescription? {
        return  NSEntityDescription.entity(forEntityName: "Statement", in: context)
    }
    
    
    
    func createState(id:UUID, state_number:String, state_message:String, state_image:String, state_description: String, created_at:Date, date_format:String){
        let statement = Statement(context: persistentContainer.viewContext)
        let urls = FileManager.default.urls(for: .documentDirectory, in:  .userDomainMask)
        print(urls[urls.count-1] as URL)
        
        statement.id = id
        statement.state_number = state_number
        statement.state_image = state_image
        statement.state_message = state_message
        statement.created_at = created_at
        statement.state_description = state_description
        statement.date_format = date_format
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func readAllUser() -> [Statement] {
        
        let fetchRequest: NSFetchRequest<Statement> = Statement.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func fetchStatementForDate(startDate: Date, endDate: Date) -> [Statement] {
        print(startDate)
        let fetchRequest: NSFetchRequest<Statement> = Statement.fetchRequest()
        let predicate = NSPredicate(format: "(created_at >= %@) AND (created_at <= %@)", startDate as NSDate, endDate as NSDate)
        fetchRequest.predicate = predicate
        
        do {
            let statements = try context.fetch(fetchRequest)
            return statements
        } catch {
            print("Error fetching statements: \(error.localizedDescription)")
            return []
        }
    }

    
    
}








