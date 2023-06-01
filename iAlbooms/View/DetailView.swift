//
//  DetailView.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 31/05/23.
//

import SwiftUI

struct DetailView: View {
    let id: Int
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    Group{
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                        Text("\(id)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 1.0)
                            .padding(.top, 2.0)
                        
                        Text("Nama Band")
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.vertical, 2.0)
                        HStack{
                            Text("Genre")
                                .font(.footnote)
                            
                            Text("Tahun")
                                .font(.footnote)
                        }.padding(.vertical, 2.0)
                    }.padding(.vertical, 0)
                    
                    Text("Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet")
                        .padding(.horizontal)
                        .padding(.bottom, 10.0)
                        .font(.caption)
                    
                    Group{
                        Divider()
                        
                        ForEach(1..<10){ i in
                            HStack(spacing: 15){
                                Text("\(i)")
                                    .foregroundColor(Color.gray)
                                Text("Judul Lagu")
                                    .fontWeight(.regular)
                            }.frame(alignment: .leading)
                                .padding(.leading)
                            
                            if i != 10 - 1{
                                Divider()
                                    .padding(.leading, 40.0)
                            }
                        }
                        
                        Divider()
                        
                        Group{
                            Text("dd MM yyy")
                            Text("jumlah, durasi")
                        }
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding(.leading)
                        .padding(.vertical, 2.0)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    
                    Spacer()
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .primaryAction){
                Button{
                    
                }label:{
                    Image(systemName: "star.circle.fill")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: Int())
    }
}
