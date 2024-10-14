//
//  ContentView.swift
//  practice
//
//  Created by Nicholas Homayouni on 10/7/24.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var labelText = "initial text"
    
    func updateLabel() {
        labelText = "Updated text"
    }
}

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.labelText).padding()
            Button("Update label") {
                viewModel.updateLabel()
            }
            .padding()
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
