//
//  Router.swift
//  RouterTest
//
//  Created by Afnan Ahmad on 2023-01-17.
//

import Foundation
import SwiftUI

// MARK: - View
struct CaptureModeView: View {
    @Environment(\.presentationMode) var presentationMode
    let viewModel: CaptureModeViewModel

    var body: some View {
        VStack {
            Button {
                viewModel.dismiss()
            } label: {
                Text("Dismiss")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .onAppear {
            /// Passing captured enviroment varilables on to view model
            viewModel.update(presentationMode: presentationMode)
        }
    }
}

// MARK: - View Model
class CaptureModeViewModel {
    let router: CaptureModeRouter
    var presentationMode: Binding<PresentationMode>?

    init(router: CaptureModeRouter) {
        self.router = router
    }

    func update(presentationMode: Binding<PresentationMode>) {
        self.presentationMode = presentationMode
    }

    func dismiss() {
        presentationMode?.wrappedValue.dismiss()
    }
}

struct ContentModeView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureModeView(viewModel: .init(router: .init()))
    }
}

// MARK: - Router
class CaptureModeRouter {}
