//
//  NewsView.swift
//  TestProject
//
//  Created by 1 on 12.04.2024.
//

import Foundation
import SwiftUI

struct NewsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                StoryView()
                Divider()
                PostView(posts: posts)
            }
            .navigationTitle("Новости")
            .background(Color("CastomGrey"))
        }
    }
}

#Preview {
    NewsView()
}
