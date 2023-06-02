//
//  DetailView.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 31/05/23.
//

import SwiftUI

struct DetailView: View {
    @State var album: Album
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    Group{
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                        Text(album.albumName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 1.0)
                            .padding(.top, 2.0)
                        
                        Text(album.artistName)
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.vertical, 2.0)
                        HStack{
                            Text(album.albumGenre)
                                .font(.footnote)
                            
                            Text(album.albumYear)
                                .font(.footnote)
                        }.padding(.vertical, 2.0)
                    }.padding(.vertical, 0)
                    
                    Text(album.albumDescription)
                        .padding(.horizontal)
                        .padding(.bottom, 10.0)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
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
                            Text(album.albumDate)
                            Text(album.albumDuration)
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
                    updateIsFavorite(withID: album.id)
                }label:{
                    Image(systemName: "star.circle.fill")
                        .foregroundColor(album.isFavorite ? Color.red : Color.black)
                }
            }
        }
    }
    
    func updateIsFavorite(withID id:Int) {
        album.isFavorite.toggle()
        
        viewModel.updateIsFavorite(withID: id)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(album: Album(id: 0, albumName: "Test", albumYear: "Test", albumGenre: "Test", albumDescription: "Test", albumDate: "Test", albumDuration: "test", artistName: "Test"))
    }
}
