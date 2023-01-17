//
//  ContentView.swift
//  RouterTest
//
//  Created by Afnan Ahmad on 2023-01-17.
//

import SwiftUI

// MARK: - View
struct CaptureView: View {
    @ObservedObject var viewModel: CaptureViewModel
    var body: some View {
        VStack {
            Button(action: viewModel.startCaptureMode) {
                Text("Start Capture Full Screen")
            }.fullScreenCover(isPresented: $viewModel.isCapturePresented,
                              content: viewModel.startCaptureFullScreen)
            Section {
                viewModel.startCaptureNavigationLink()
            }
        }
        .padding()
    }
}

// MARK: - View Model
class CaptureViewModel: ObservableObject {
    var router: CaptureRouter
    
    init(router: CaptureRouter) {
        self.router = router
    }

    @Published var isCapturePresented = false
    @Published var isAlertShowing = false
    
    /// Handing view action
    func startCaptureMode() {
        isCapturePresented.toggle()
    }
    
    /// Assumbling views
    func startCaptureFullScreen() -> some View {
        return router.makeCaptureModeView()
    }
    
    func startCaptureNavigationLink() -> some View {
        return router.makeCaptureModeViewNavigationLink()
    }
}

// MARK: - Router
class CaptureRouter {
    func makeCaptureModeView() -> some View {
        let router = CaptureModeRouter()
        let viewModel = CaptureModeViewModel(router: router)
        let view = CaptureModeView(viewModel: viewModel)
        return view
    }

    func makeCaptureModeViewNavigationLink() -> some View {
        let router = CaptureModeRouter()
        let viewModel = CaptureModeViewModel(router: router)
        let view = CaptureModeView(viewModel: viewModel)
        return NavigationLink("Start Capture Navigate", destination: view)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CaptureView(viewModel: .init(router: .init()))
        }
    }
}
