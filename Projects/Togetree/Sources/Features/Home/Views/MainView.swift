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
    @StateObject private var userViewModel = UserViewModel()
    
    @State var selectedUser: User?
//    @State var isLoading: Bool = true
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    if selectedUser != nil {
                        ProfileHorizontalListView(selectedUser: $selectedUser, spacing: 12)
                        GoalListView(selectedUser: $selectedUser, goalViewModel: goalViewModel)
                    }

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
        .task {
            do {
                try await userViewModel.loadUser(with: authViewModel.currentUserId!)
                selectedUser = userViewModel.selectedUser
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    @State static var authViewModel = AuthViewModel()
    
    static var previews: some View {
        MainView()
            .environmentObject(authViewModel)
    }
}
