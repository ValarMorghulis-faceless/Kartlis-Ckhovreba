//
//  NewPostForm.swift
//  KartlisCkhovreba
//
//  Created by Giorgi Samkharadze on 03.09.22.
//

import SwiftUI

struct NewPostForm: View {
    @State private var state = FormState.idle
    @Environment(\.dismiss) private var dismiss
    typealias CreateAction = (Post) async throws -> Void
    let createAction: CreateAction
    @State private var post = Post(title: "", content: "", authorName: "")
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Title", text: $post.title)
                    TextField("Author Name", text: $post.authorName)
                }
                Section("Content") {
                    TextEditor(text: $post.content)
                        .multilineTextAlignment(.leading)
                }
                Button(action: createPost) {
                    if state == .working {
                        ProgressView()
                    } else {
                        Text("Create Post")
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .listRowBackground(Color.accentColor)
            }
            .onSubmit(createPost)
            .navigationTitle("New Post")
        }
        .disabled(state == .working)
        .alert("Cannot Create Post", isPresented: $state.isError, actions: {}) {
            Text("Sorry, something went wrong.")
        }
    }
    private func createPost() {
        Task {
            do {
                state = .working
                try await createAction(post)
                dismiss()
            } catch {
                print("[NewPostForm Cannot create post: \(error)")
                state = .error
            }
        }
       
    }
    private enum FormState{
         case idle, working, error
        
        var isError: Bool {
            get {
                self == .error
            }
            set {
                guard !newValue else { return }
                self = .idle
            }
        }
     }
}

struct NewPostForm_Previews: PreviewProvider {
    static var previews: some View {
        NewPostForm(createAction: {_ in})
    }
}
