//
//  HobbyView.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/29/24.
//

import SwiftUI

struct HobbyView: View {
    @AppStorage("savedHobby") private var savedHobby: String = "Loading..."
    
    var body: some View {
        VStack {
            Text("내 취미는")
                .font(.system(size: 25))
                .foregroundColor(.primary)
                .padding(.top, 60)
            
            Text(savedHobby)
                .font(.system(size: 40))
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.top, 40)
            
            NavigationLink(destination: UpdateView()) {
                Text("내 정보 변경하러 가기")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.9, green: 0.6, blue: 0.5), lineWidth: 1))
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding(20)
        .background(Color(.systemBackground))
        .navigationBarHidden(true)
    }
}

struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HobbyView()
        }
    }
}
