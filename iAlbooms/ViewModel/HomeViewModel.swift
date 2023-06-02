//
//  HomeViewModel.swift
//  iAlbooms
//
//  Created by Muhammad Fakhryan on 01/06/23.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    enum ViewState {
        case START
        case LOADING
        case SUCCESS(albums: [Album])
        case FAILURE(error: String)
    }
    
    @Published var albums: [Album] = [
        Album(id: 1, albumName: "Mylo Xyloto", albumYear: "2011", albumGenre: "Alternatif", albumDescription: "", albumDate: "19 Oktober 2011", albumDuration: "14 lagu, 44 menit", artistName: "Coldplay"),
        Album(id: 2, albumName: "A Head Full of Dreams", albumYear: "2015", albumGenre: "Alternatif", albumDescription: "Musik untuk merayakan kebahagiaan dan pengharapan di masa depan", albumDate: "4 Desember 2015", albumDuration: "11 lagu, 46 menit", artistName: "Coldplay"),
        Album(id: 3, albumName: "Ghost Stories", albumYear: "2014", albumGenre: "Alternatif", albumDescription: "", albumDate: "19 Mei 2014 ", albumDuration: "9 lagu, 43 menit", artistName: "Coldplay"),
        Album(id: 4, albumName: "Everyday Life", albumYear: "2019", albumGenre: "Alternatif", albumDescription: "Album ganda kaya tekstur dan genre dari band Inggris ternama", albumDate: "22 November 2019", albumDuration: "16 lagu, 53 menit", artistName: "Coldplay"),
        Album(id: 5, albumName: "Parachutes", albumYear: "2000", albumGenre: "Alternatif", albumDescription: "", albumDate: "10 Juli 2000", albumDuration: "10 lagu, 42 menit", artistName: "Coldplay", isFavorite: true)
    ]
    
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        getAlbums()
    }
    
    func getAlbums(){
        self.currentState = .LOADING
        DispatchQueue.main.asyncAfter(deadline: .now() + 0){
            self.currentState = .SUCCESS(albums: self.albums)   
        }
    }
    
    func updateIsFavorite(withID id:Int) {
        if let itemIndex = albums.firstIndex(where: {$0.id == id}){
            albums[itemIndex].isFavorite.toggle()
        }
    }
}
