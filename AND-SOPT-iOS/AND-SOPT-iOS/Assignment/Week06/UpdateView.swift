//
//  UpdateView.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/29/24.
//

import SwiftUI

struct UpdateView: View {
    @State private var password: String = ""
    @State private var hobby: String = ""
    @State private var resultMessage: String = ""
    
    @AppStorage("savedPassword") private var savedPassword: String = ""
    @AppStorage("savedHobby") private var savedHobby: String = ""
    
    var body: some View {
        VStack() {
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 200)
            
            TextField("Hobby", text: $hobby)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 20)
            
            Button(action: {
                changeButtonTapped()
            }) {
                Text("정보 변경하기")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.9, green: 0.6, blue: 0.5), lineWidth: 1))
            }
            .padding(.top, 30)
            
            Text(resultMessage)
                .foregroundColor(.black)
                .padding(.top, 40)
            
            Spacer()
            
            NavigationLink(destination: HobbyView()) {
                Text("내 정보 보러가기")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.9, green: 0.6, blue: 0.5), lineWidth: 1))
            }
            .padding(.bottom, 50)
        }
        .padding(20)
        .background(Color(.systemBackground))
        .navigationBarHidden(true)
    }
    
    private func changeButtonTapped() {
        if !password.isEmpty {
            savedPassword = password
        }
        if !hobby.isEmpty {
            savedHobby = hobby
        }
        
        resultMessage = "정보가 성공적으로 변경되었습니다."
        
        password = ""
        hobby = ""
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UpdateView()
        }
    }
}
