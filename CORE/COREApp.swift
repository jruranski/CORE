//
//  COREApp.swift
//  CORE
//
//  Created by Jakub Ruranski on 19/07/2020.
//

import SwiftUI
import CoreData

@main
struct COREApp: App {
    
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            TabBar().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}




public class PersistentContainer {
    // MARK: - Define Constants / Variables
    public static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    // MARK: - Initializer
    private init() {}
    // MARK: - Core Data stack
    public static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // MARK: - Core Data Saving support
    public static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
