//
//  EZ_AppleApp.swift
//  EZ.Apple
//
//  Created by Herry on 2023/05/01.
//

import SwiftUI

@main
struct EZ_AppleApp: App {
    init() {
        Thread.sleep(forTimeInterval: 1)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(dateFormat: DateFormat())
        }
    }
}

