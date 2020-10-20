//
//  Persistence.swift
//  ThorRecipes2
//
//  Created by P. Kurt Thorderson on 9/29/20.
//

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
  
//  static var preview: PersistenceController = {
//    let result = PersistenceController(inMemory: true)
//    let viewContext = result.container.viewContext
//    for _ in 0..<10 {
//      let newRecipe = Recipe(context: viewContext)
//      newRecipe.name = "George"
//    }
//    do {
//      try viewContext.save()
//    } catch {
//      let nsError = error as NSError
//      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//    }
//    return result
//  }()
  
  let container: NSPersistentCloudKitContainer
  
  init(inMemory: Bool = false) {
    container = NSPersistentCloudKitContainer(name: "ThorRecipes2")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
    container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy //source of truth is CloudKit over phone/iPad
    guard let description = container.persistentStoreDescriptions.first else {
      fatalError("### \(#function): Failed to receive a persistent store description")
    }
    description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
    description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
    description.cloudKitContainerOptions?.databaseScope = .public
//    description.cloudKitContainerOptions?.databaseScope = .private
    
//
//    ////////////////////////////// for multiple persistent stores
//    let publicStoreURL = description.url!.deletingLastPathComponent().appendingPathComponent("ThorRecipes2-public.sqlite")
//    let identifier = description.cloudKitContainerOptions!.containerIdentifier
//
//    let publicDescription = NSPersistentStoreDescription(url: publicStoreURL)
//    publicDescription.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
//    publicDescription.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
//
//    let publicOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: identifier)
//
//    publicOptions.databaseScope = .public
//    publicDescription.cloudKitContainerOptions = publicOptions
//    container.persistentStoreDescriptions.append(publicDescription) // append to array of containers we want to load
//    container.loadPersistentStores(completionHandler: {(_, error) in
//      guard let error = error as NSError? else{return}
//      fatalError("### \(#function): Failed to receive a persistent stores;\(error)")
//    })
  }
  
  ////////////////// This is what to use to determine if a public record can be updated
//  let appDelegate = UIApplication.shared.delegate as! AppDelegate
//  let container = appDelegate.coreDataStack.persistentContainer
//
//  if container.canUpdateRecord(forManagedObjectWith: post!.objectID) {
//  navigationItem.rightBarButtonItem?.isEnabled = true
//  } else {
//  navigatonItem.rightBarButtonItem?.isEnabled = false
//  }
  
  // Also
  
  
  //  if container.canModifyManagedObjects(in: post!.objectID.persistentStore) {
  //  navigationItem.rightBarButtonItem?.isEnabled = true
  //  } else {
  //  navigatonItem.rightBarButtonItem?.isEnabled = false
  //  }
  
  // Also
  
  
  //  if container.canDeleteRecord(forManagedObjectWith: post!.objectID) {
  //  container.viewcontext.performAndWait{
  //   container.viewContext.delete(tag!)
  //   }
  //  } else {
  //    tag!.isTrashed = true
  //  }
//  let fetchRequest = Tag.fetchRequest()
//  fetchRequest.predicate = NSPredicate(format: "isTrashed = false")
  
  
  
  
}
