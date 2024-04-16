//
//  PostModel.swift
//  TestProject
//
//  Created by 1 on 12.04.2024.
//

import Foundation

struct PostModel: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let userProfileImage: String
    let postImageName: String
    let description:String
    let countLike: Int
    
    init(name: String, date: String, postImageName: String, description: String, imageUser: String, countLike: Int) {
        self.name = name
        self.date = date
        self.userProfileImage = imageUser
        self.postImageName = postImageName
        self.description = description
        self.countLike = countLike
    }
}

let posts = [
    PostModel(name: "Жорик", date: "16.04.23", postImageName: "image8", description: "Какой красивый кот", imageUser: "image1", countLike: 3),
    PostModel(name: "Эмма", date: "16.04.23", postImageName: "image9", description: "Зеленые луга", imageUser: "image2", countLike: 4),
    PostModel(name: "Миша", date: "16.04.23", postImageName: "image10", description: "Красивая природа", imageUser: "image3", countLike: 10),
    PostModel(name: "Софа", date: "16.04.23", postImageName: "image11", description: "Листва", imageUser: "image4", countLike: 5),
    PostModel(name: "Давид", date: "16.04.23", postImageName: "image12", description: "Закат на море", imageUser: "image5", countLike: 8),
    PostModel(name: "Ольга", date: "16.04.23", postImageName: "image13", description: "Лес", imageUser: "image6", countLike: 7),
    PostModel(name: "Данил", date: "16.04.23", postImageName: "image14", description: "Туман", imageUser: "image7", countLike: 6)
]
