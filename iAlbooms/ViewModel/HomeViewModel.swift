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
    
    let albums: [Album] = [
        Album(id: 1, albumName: "Mylo Xyloto", albumCover: "", artistName: "Coldplay"),
        Album(id: 2, albumName: "A Head Full of Dreams", albumCover: "", artistName: "Coldplay"),
        Album(id: 3, albumName: "Ghost Stories", albumCover: "", artistName: "Coldplay"),
        Album(id: 4, albumName: "Everyday Life", albumCover: "", artistName: "Coldplay"),
        Album(id: 5, albumName: "Parachutes", albumCover: "", artistName: "Coldplay")
    ]
    
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        getAlbums()
    }
    
    func getAlbums(){
        self.currentState = .LOADING
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.currentState = .SUCCESS(albums: self.albums)
        }
    }
}
