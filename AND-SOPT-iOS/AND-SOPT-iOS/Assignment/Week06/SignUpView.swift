//
//  SignUpView.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/29/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var hobby: String = ""
    @State private var resultMessage: String = "모든 항목을 8자 이내로 작성해주세요"
    
    // AppStorage를 사용하여 입력값을 저장
    @AppStorage("savedUsername") private var savedUsername: String = ""
    @AppStorage("savedPassword") private var savedPassword: String = ""
    @AppStorage("savedHobby") private var savedHobby: String = ""
    
    var body: some View {
        VStack {
            TextField("User Name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding(.top, 100)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 20)
            
            TextField("Hobby", text: $hobby)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding(.top, 20)
            
            Button(action: {
                if username.isEmpty || password.isEmpty || hobby.isEmpty {
                    resultMessage = "모든 항목을 입력해주세요."
                } else {
                    savedUsername = username
                    savedPassword = password
                    savedHobby = hobby
                    resultMessage = "회원 등록에 성공했어요."
                }
            }) {
                Text("유저 등록하기")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.678, green: 0.847, blue: 1.0), lineWidth: 1))
            }
            .padding(.top, 30)
            
            Text(resultMessage)
                .foregroundColor(.black)
                .padding(.top, 40)
            
            Spacer()
            
            NavigationLink(destination: LoginView()) {
                Text("로그인 바로가기")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.6, green: 0.8, blue: 0.6), lineWidth: 1))
            }
            .padding(.bottom, 50)
        }
        .padding(20)
        .background(Color(.systemBackground))
        .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView()
        }
    }
}
