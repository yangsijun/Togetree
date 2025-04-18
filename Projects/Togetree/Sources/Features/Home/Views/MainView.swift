//
//  MainView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @StateObject private var goalViewModel = GoalViewModel()
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ProfileHorizontalListView(userId: mockUserList[0].id)
                    Divider()
                    GoalListView(userId: authViewModel.currentUserId!, goalViewModel: goalViewModel)
                }
            }
            .background(Color.secondaryBackground)
            .navigationTitle(Text("Togetree"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        showModal = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showModal) {
                        NavigationStack {
                            NewGoalView(
                                goalViewModel: goalViewModel,
                                showModal: $showModal
                            )
                        }
                    }
                }
            }
            // TODO: Implement Search feature
            .searchable(text: .constant(""))
        }
        .tint(Color.tintColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
