//
//  FaceLockApp.swift
//  FaceLock
//
//  Created by Harjot Bharti on 7/9/24.
//

import SwiftUI

@main
struct FaceLockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(authenticator: .init())
        }
    }
}
