//
//  FavoritesViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-08.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class FavoritesViewModel: ObservableObject {
    @Published private(set) var facilityData: [FacilityModel] = []
    private var favorite = FavoriteViewModel()
    private var facilityID = [String]()
    
    
    func fetchData() {
        
        //Get reference to database
        let db = Firestore.firestore()
        
        //Get reference to user
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let docRef = db.collection("Favorites").document(userID)

       docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
        for facility in facilityID {
            favorite.fetchData(facID: facility)
            self.facilityData.append(favorite.favoriteData)
        }
    }
}
