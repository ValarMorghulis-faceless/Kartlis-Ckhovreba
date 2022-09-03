//
//  PostsRow.swift
//  KartlisCkhovreba
//
//  Created by Giorgi Samkharadze on 03.09.22.
//

import SwiftUI

struct PostsRow: View {
    let post: Post
 
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(post.authorName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Text(post.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
            }
            .foregroundColor(.gray)
            Text(post.title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(post.content)
        }
        .padding(.vertical)
    }
}
struct PostsRow_Previews: PreviewProvider {
    static var previews: some View {
        PostsRow(post: Post.testPost)
    }
}
