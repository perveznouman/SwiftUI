//
//  SearchView.swift
//  Try
//
//  Created by Nouman Pervez on 19/01/24.
//

import SwiftUI

struct TableView: View {
    @Binding var filteredList: [String]
    @Binding var userList: [String]

    @State var searchText: String = ""

    var body: some View {
        
        List (filteredList, id: \.self) { user in
            Text(user)
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) {
            if(searchText.isEmpty) {
                filteredList = userList
            }
            else {
                filteredList = userList.filter({ $0.contains(searchText)
                })
            }
        }
    }
}

struct SearchView: View {
    
    @State var inputText: String = ""
    @State var userList: [String] = []
    @State var filteredList: [String] = []

    var body: some View {
        
        VStack {
            TableView(filteredList: $filteredList, userList: $userList)
            
            Text("Current user: " + (userList.last ?? ""))
            TextField("Enter new name", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if(!inputText.isEmpty) {
                        filteredList.append(inputText)
                        userList = filteredList
                        inputText = ""
                    }
                }
            Spacer()
            
        }
        .padding()
        .onAppear(perform: {
            
        })
    }
}

#Preview {
    NavigationStack {
        SearchView()
            .navigationTitle("User List")
    }
}
