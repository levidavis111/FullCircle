//
//  ActionPersistenceManager.swift
//  FullCircle
//
//  Created by Levi Davis on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import Foundation

struct ActionPersistenceManager {
    static let manager = ActionPersistenceManager()
    
    private let persistenceHelper = PersistenceHelper<Action>(fileName: "savedActions.plist")
    
    func saveAction(action: Action) throws {
        try persistenceHelper.save(newElement: action)
    }
    
    func getSavedActions() throws -> [Action] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteAction(actions: [Action], at index: Int) throws {
        try persistenceHelper.delete(elements: actions, index: index)
    }
}

