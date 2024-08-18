//
//  CoreDataWrapper.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation
import CoreData

private class PersistenceContainer: NSPersistentContainer, @unchecked Sendable {
    
    override class func defaultDirectoryURL() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!.absoluteURL
    }
}

final class CoreDataWrapper {
    
    static let shared = CoreDataWrapper()
    
    private lazy var context = persistentContainer.viewContext
    private static let storeName = "CatMate"
    
    private static let modelURL: URL = {
        guard let url = Bundle.main.url(forResource: storeName, withExtension: "momd") else { abort() }
        return url
    }()
    
    private static let model: NSManagedObjectModel = {
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else { abort() }
        return model
    }()
    
    private lazy var persistentContainer: PersistenceContainer = {
        
        let container = PersistenceContainer(name: Self.storeName, managedObjectModel: Self.model)
        container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        
        container.loadPersistentStores { (_, error) in
            guard error == nil else {
                abort()
            }
        }
        
        return container
    }()
    
    private func createFetchRequest<T: NSManagedObject>(ofType type: T.Type, fetchOffset: Int = 0, fetchLimit: Int = 0, fetchBatchSize: Int = 0, sortDescriptors: [NSSortDescriptor] = []) -> NSFetchRequest<T>{
        
        let request = NSFetchRequest<T>(entityName: NSStringFromClass(type))
        request.fetchOffset = fetchOffset
        request.fetchLimit = fetchLimit
        request.fetchBatchSize = fetchBatchSize
        request.sortDescriptors = sortDescriptors
        
        return request
    }
    
    func createManagedObject<T: NSManagedObject>(ofType type: T.Type) async -> T {
        
        var managedObject: T!
        
        await context.perform {
            managedObject = T(context: self.context)
        }
        
        return managedObject
    }
    
    func getAllEntries<T: NSManagedObject>(ofType type: T.Type, fetchOffset: Int = 0, fetchLimit: Int = 0, fetchBatchSize: Int = 0, sortDescriptors: [NSSortDescriptor] = []) async throws -> [T] {
        
        let request = createFetchRequest(ofType: type, fetchOffset: fetchOffset, fetchLimit: fetchLimit, fetchBatchSize: fetchBatchSize, sortDescriptors: sortDescriptors)
        var entries: [T] = []
        
        await context.perform {
            do {
                let contextEntries = try self.context.fetch(request)
                entries.append(contentsOf: contextEntries)
            } catch {}
        }
        
        return entries
    }
    
    func save(context: NSManagedObjectContext) async {
        
        await context.perform {
            
            guard context.hasChanges else { return }
            
            do {
                try context.save()
            } catch {
                NSLog("Failed to save on background context")
            }
        }
    }
}
