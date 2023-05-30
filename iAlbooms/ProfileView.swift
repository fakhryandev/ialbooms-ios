//
//  ProfileView.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 30/05/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack (spacing: 15){
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Muhammad Fakhryan Zulfahmi")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                
                Text(verbatim: "fakhryanmuhammad@gmail.com")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.regular)
                
            }
                .navigationTitle("About")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        Button("Selesai"){
                            dismiss()
                        }
                    }
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
