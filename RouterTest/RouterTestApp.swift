//
//  RouterTestApp.swift
//  RouterTest
//
//  Created by Afnan Ahmad on 2023-01-17.
//

import SwiftUI

@main
struct RouterTestApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
               captureView()
            }
        }
    }
    
    func captureView() -> some View {
        let router = CaptureRouter()
        let viewModel = CaptureViewModel(router: router)
        let view = CaptureView(viewModel: viewModel)
        return view
    }
}
