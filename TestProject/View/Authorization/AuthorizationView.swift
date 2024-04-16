//
//  AuthorizationView.swift
//  TestProject
//
//  Created by 1 on 15.04.2024.
//

import SwiftUI

struct AuthorizationView: View {
    @State private var log = ""
    @State private var password = ""
    @State private var isTapGo = false
    @State private var isAuthorization = true
    @State private var repeatPassword = ""
    @State private var messageError = ""
    @State private var isShowAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                Text(isAuthorization ? "Авторизация" : "Регистрация")
                    .padding()
                    .padding(.horizontal, 30)
                    .font(.title2.bold())
                    .background(Color("TransparentWhite"))
                    .cornerRadius(30)
                VStack{
                    TextField("Введите email", text: $log)
                        .padding()
                        .padding(.horizontal, 30)
                        .font(.title2.bold())
                        .background(Color("TransparentWhite"))
                        .cornerRadius(20)
                    
                    SecureField("Введите пароль", text: $password)
                        .padding()
                        .padding(.horizontal, 30)
                        .font(.title2.bold())
                        .background(Color("TransparentWhite"))
                        .cornerRadius(20)
                    
                    if !isAuthorization {
                        SecureField("Повторите пароль", text: $repeatPassword)
                            .padding()
                            .padding(.horizontal, 30)
                            .font(.title2.bold())
                            .background(Color("TransparentWhite"))
                            .cornerRadius(20)
                    }
                    
                    Button {
                        if isAuthorization {
                            guard log != "" else {
                                self.openAlert(messeg: "Введите email")
                                return
                            }
                            guard password != "" else {
                                self.openAlert(messeg: "Введите пароль")
                                return
                            }
                            
                            AuthorizationService.shated.examinationUser(email: log, password: password) { result in
                                switch result {
                                case .success(_):
                                    self.isTapGo.toggle()
                                case .failure(let error):
                                    self.deleteData()
                                    self.openAlert(messeg: "Произошла ошибка - \(error.localizedDescription)")
                                }
                            }
                            
                        } else {
                            guard log != "" else { 
                                self.openAlert(messeg: "Введите email")
                                return
                            }
                            guard password != "" else { 
                                self.openAlert(messeg: "Введите пароль")
                                return
                            }
                            guard password == repeatPassword else { 
                                self.openAlert(messeg: "Пароли не совпадают")
                                return
                            }
                            
                            AuthorizationService.shated.createUser(email: log,password: password) { result in
                                switch result {
                                case .success(_):
                                    self.openAlert(messeg: "Вы успешно зарегистрировались")
                                    self.deleteData()
                                    self.isAuthorization.toggle()
                                case .failure(let error):
                                    self.openAlert(messeg: "Произошла ошибка - \(error.localizedDescription)")
                                    self.deleteData()
                                    self.isAuthorization.toggle()
                                }
                            }
                        }
                    } label: {
                        Text(isAuthorization ? "Войти" : "Создать аккаунт")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .font(.title3.bold())
                            .background(Color("CastomGrey"))
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        isAuthorization.toggle()
                        deleteData()
                    } label: {
                        Text(isAuthorization ? "Зарегистрироваться" : "Уже есть аккаунт")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .font(.title3.bold())
                            .background(Color("CastomGrey"))
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color("CastomBlack"))
                .cornerRadius(30)
                .padding(30)
                .alert(messageError, isPresented: $isShowAlert, actions: {
                    Button {} label: {
                        Text("OK")
                    }
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("backgroundVK").resizable().frame(maxWidth: 900,maxHeight: .infinity).ignoresSafeArea().blur(radius: isAuthorization ? 0 : 6))
            .animation(Animation.easeInOut(duration: 0.3),value: isAuthorization)
            
        }
        .fullScreenCover(isPresented: $isTapGo, content: {
            NewsView()
        })
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
    
    private func deleteData(){
        self.log = ""
        self.password = ""
        self.repeatPassword = ""
    }
    
    private func openAlert(messeg: String) {
        messageError = messeg
        isShowAlert.toggle()
    }
}

#Preview {
    AuthorizationView()
}
