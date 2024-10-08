//
//  ContentView.swift
//  practice
//
//  Created by Nicholas Homayouni on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var labelText = "Initial Text"
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Status Checker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 50)
            
            Text(labelText)
                .font(.title2)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .accessibilityIdentifier("statusLabel")
                .padding()
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            
            Button(action: {
                labelText = "Status: Updated Successfully"
            }) {
                Text("Update Status")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .accessibilityIdentifier("updateButton")
            .padding(.horizontal, 40)
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}



#Preview {
    ContentView()
}
