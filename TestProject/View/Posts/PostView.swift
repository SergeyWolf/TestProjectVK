//
//  PostView.swift
//  TestProject
//
//  Created by 1 on 12.04.2024.
//

import Foundation
import SwiftUI

struct PostView: View {
    let posts: [PostModel]
    var body: some View {
        VStack {
            ForEach(posts) { post in
                PostItemView(post: post)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .padding(.vertical, 7)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    PostView(posts: posts)
}
