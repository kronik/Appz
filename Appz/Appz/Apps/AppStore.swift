//
//  AppStore.swift
//  Appz
//
//  Created by Mazyad Alabduljaleel on 11/9/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


public extension Applications {
    
    public struct AppStore: ExternalApplication {
        
        public let scheme = "itms-apps:"
        public let fallbackURL: String? = "http:"
    }
    
    public func appStore(action: AppStore.Action) -> Bool {
        return appCaller.launch(AppStore(), action: action)
    }
}

// MARK: - Actions

public extension Applications.AppStore {

    public enum Action {
    
        case Account(id: String)
        case App(id: String)
    }
}


extension Applications.AppStore.Action: ExternalApplicationAction {

    public var paths: ActionPaths {
        
        switch self {
        case .Account(let id):
            return ActionPaths(
                app: Path(
                    pathComponents: ["itunes.apple.com", "developer", "id", id],
                    queryParameters: [:]
                ),
                web: Path()
            )
            
        case .App(let id):
            return ActionPaths(
                app: Path(
                    pathComponents: ["itunes.apple.com", "apps", "id", id],
                    queryParameters: [:]
                ),
                web: Path()
            )
        }
    }
}

