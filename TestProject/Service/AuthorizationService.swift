//
//  AuthorizationService.swift
//  TestProject
//
//  Created by 1 on 15.04.2024.
//

import Foundation
import FirebaseAuth

class AuthorizationService {
    static let shated = AuthorizationService()
    
    private init() {}
    private let auth = Auth.auth()
    private var currentUser: User? {
        return auth.currentUser
    }
    
    func createUser(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void){
        auth.createUser(withEmail: email, password: password){ result, error in
            if let result = result {
                completion(.success(result.user))
            }
            
            if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func examinationUser(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void){
        auth.signIn(withEmail: email, password: password){ result, error in
            if let result = result {
                completion(.success(result.user))
            }
            
            if let error = error {
                completion(.failure(error))
            }
        }
    }
}
