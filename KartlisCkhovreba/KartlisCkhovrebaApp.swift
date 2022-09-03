//
//  KartlisCkhovrebaApp.swift
//  KartlisCkhovreba
//
//  Created by Giorgi Samkharadze on 03.09.22.
//

import SwiftUI
import Firebase

@main
struct KartlisCkhovrebaApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            PostsList()
        }
    }
}
