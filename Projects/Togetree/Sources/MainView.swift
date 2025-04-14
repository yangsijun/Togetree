//
//  MainView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: Profile List
                // TODO: Goal List
            }
            .navigationTitle(Text("Togetree"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        // TODO: New Goal
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // TODO: Implement Search feature
            .searchable(text: .constant(""))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
