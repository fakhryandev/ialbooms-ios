//
//  ContentView.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 30/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    HStack{
                        Text("Dengarkan")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Button{
                            showingSheet.toggle()
                        }label: {
                            Image(systemName: "person.circle")
                                .font(Font.system(.largeTitle)).foregroundColor(Color.red)
                            
                        }.sheet(isPresented: $showingSheet) {
                            ProfileView()
                        }
                    }
                    
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
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack (spacing: 15){
                            ForEach(0..<10) { _ in
                                NavigationLink(destination: DetailView()){
                                    VStack(alignment: .leading){
                                        Image(systemName: "play.rectangle.fill")
                                            .resizable()
                                            .frame(width: 150.0, height: 100.0)
                                            .foregroundColor(Color.red)
                                            .cornerRadius(10)
                                        Text("Nama Album")
                                            .font(.headline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.black)
                                        Text("Artist")
                                            .foregroundColor(Color.gray)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }.padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
