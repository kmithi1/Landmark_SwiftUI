//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mithilesh Kumar on 29/03/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
