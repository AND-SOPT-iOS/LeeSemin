//
//  LoginView.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/29/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var resultMessage: String = ""
    @State private var isLoggedIn: Bool = false
    
    // AppStorage에서 저장된 값을 불러오기
    @AppStorage("savedUsername") private var savedUsername: String = ""
    @AppStorage("savedPassword") private var savedPassword: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("User Name", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.top, 150)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.top, 20)
                
                Button(action: {
                    if username.isEmpty || password.isEmpty {
                        resultMessage = "모든 항목을 입력해주세요."
                    } else if username == savedUsername && password == savedPassword {
                        resultMessage = "로그인에 성공했어요."
                        isLoggedIn = true
                    } else {
                        resultMessage = "회원 정보가 없습니다."
                    }
                }) {
                    Text("로그인")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.6, green: 0.8, blue: 0.6), lineWidth: 1))
                }
                .padding(.top, 30)
                
                Text(resultMessage)
                    .foregroundColor(.black)
                    .padding(.top, 40)
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    Text("유저 등록하러 가기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.678, green: 0.847, blue: 1.0), lineWidth: 1))
                }
                .padding(.bottom, 50)
            }
            .padding(20)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $isLoggedIn) {
                HobbyView()
                    .navigationBarHidden(true)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
