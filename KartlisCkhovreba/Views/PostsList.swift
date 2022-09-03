//
//  PostsList.swift
//  KartlisCkhovreba
//
//  Created by Giorgi Samkharadze on 03.09.22.
//

import SwiftUI

struct PostsList: View {
   @StateObject var viewModel = PostsViewModel()
    @State private var showNewPostForm = false
    
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
            if searchText.isEmpty || post.contains(searchText) {
            PostsRow(post: post)
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Posts")
        .toolbar {
            Button {
                showNewPostForm = true
            } label: {
                Label("New Post", systemImage: "square.and.pencil")
            }
        }
        }
        .sheet(isPresented: $showNewPostForm) {
            NewPostForm(createAction: viewModel.makeCreateAction())
        }
    }
        
        }


struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
