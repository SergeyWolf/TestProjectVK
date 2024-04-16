//
//  TestProjectApp.swift
//  TestProject
//
//  Created by 1 on 12.04.2024.
//

import SwiftUI
import FirebaseCore

@main
struct TestProjectApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AuthorizationView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
      }
    }
}
