//
//  PostItemView.swift
//  TestProject
//
//  Created by 1 on 12.04.2024.
//

import Foundation
import SwiftUI

struct PostItemView: View {
    let post: PostModel
    @State private var countLike = 0
    @State private var likeToggle = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 1) {
                Image(post.userProfileImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    Text(post.name)
                        .bold()
                    Text(post.date)
                        .font(.footnote)
                }
                Spacer()
           }
            VStack {
                Image(post.postImageName)
                    .resizable()
                    .scaledToFill()
            }
            .frame(maxHeight: 400)
            .background(Color.white)
            .cornerRadius(0)
            
            HStack(spacing: 1) {
                Text(likeToggle ? "\(countLike)" : "\(post.countLike)")
                    .font(.title3)
                
                Button {
                    if likeToggle {
                        countLike = countLike - 1
                        likeToggle.toggle()
                    } else {
                        countLike = post.countLike + 1
                        likeToggle.toggle()
                    }
                } label: {
                    Image(systemName: "heart")
                }
            }
            .foregroundColor(.black)
            .font(.title3)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            
            HStack {
                Text(post.description)
                    .font(.footnote)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    PostItemView(post: posts[0])
}
