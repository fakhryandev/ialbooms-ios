//a
//  ContentView.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 30/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        GeometryReader { geometry in
            if case .LOADING = viewModel.currentState{
                loaderView()
            }else if case .SUCCESS(let albums) = viewModel.currentState{
                NavigationView{
                    ScrollView{
                        VStack {
                            //                            HStack{
                            //                                Text("Dengarkan")
                            //                                    .font(.largeTitle)
                            //                                    .fontWeight(.bold)
                            //                                    .frame(maxWidth: .infinity, alignment: .leading)
                            //                                Button{
                            //                                    showingSheet.toggle()
                            //                                }label: {
                            //                                    Image(systemName: "person.circle")
                            //                                        .font(Font.system(.largeTitle)).foregroundColor(Color.red)
                            //                                }.sheet(isPresented: $showingSheet) {
                            //                                    ProfileView()
                            //                                }
                            //                            }
                            //                            .padding(.bottom, 20)
                            
                            Button{
                                
                            }label: {
                                Group{
                                    Text("Favorit")
                                        .foregroundColor(Color.black)
                                    Image(systemName:"greaterthan" ).foregroundColor(Color.gray).font(.body)
                                }
                                .font(.title2).fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            favoriteView(favoriteAlbum: albums)
                            
                            albumListView(albums: albums)
                            
                            Spacer()
                        }.padding(.leading)
                    }
                    .navigationBarTitle("Dengarkan")
                    //                    .navigationBarItems(trailing:
                    //                                            Button{
                    //                        showingSheet.toggle()
                    //                    }label: {
                    //                        Image(systemName: "person.circle")
                    //                            .font(Font.system(.largeTitle)).foregroundColor(Color.red)
                    //                    }.sheet(isPresented: $showingSheet) {
                    //                        ProfileView()
                    //                    })
                }
            }else if case .FAILURE(let error) = viewModel.currentState{
                VStack(alignment: .center){
                    Spacer()
                    Text(error)
                        .font(.headline.bold())
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

func albumListView(albums: [Album]) -> some View {
    let columns = [
        GridItem(spacing: 0),
    ]
    
    return LazyVGrid(columns: columns, spacing: 50){
        ForEach(albums){ album in
            NavigationLink(destination: DetailView(id: album.id)){
                HStack{
                    Image(systemName: "play.rectangle.fill"
                    )
                    .resizable()
                    .frame(width: 150, height: 150)
                    
                    VStack{
                        Text(album.albumName)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.headline)
                            .foregroundColor(Color.black)
                        
                        Text(album.artistName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
        
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.top, 30)
    .padding(.trailing)
}

func favoriteView(favoriteAlbum: [Album]) -> some View {
    ScrollView(.horizontal, showsIndicators: false){
        HStack (spacing: 15){
            ForEach(favoriteAlbum) { album in
                
                NavigationLink(destination: DetailView(id: album.id)){
                    VStack(alignment: .leading){
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .frame(width: 200.0, height: 200.0)
                            .foregroundColor(Color.red)
                            .cornerRadius(10)
                        Text(album.albumName)
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                        Text(album.artistName)
                            .foregroundColor(Color.gray)
                    }
                }
                .padding(.trailing, album.id == favoriteAlbum.count ? 16 : 0)
            }
        }
    }
}

func loaderView() -> some View {
    ZStack{
        Color.black.opacity(0.05)
            .ignoresSafeArea()
        ProgressView()
            .scaleEffect(1, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
