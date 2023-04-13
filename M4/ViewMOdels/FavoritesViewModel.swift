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
    @Published private(set) var facilityData = [FacilityModel]()//: [FacilityModel] = []
    private var favorite = FavoriteViewModel()
   // private var readFacilities = [String]()
     var readFacilities = ["256826","10081910"]

    func fetchData() {
        //Get reference to database
        let db = Firestore.firestore()
        
        //Get reference to user
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let docRef = db.collection("Favorites").document(userID)

       docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                self.readFacilities = data?["userFavorites"] as? [String] ?? []
             } else {
                print("Document does not exist")
            }
        }
        
        for facility in readFacilities {
            favorite.fetchData(facID: facility)
            self.facilityData.append(favorite.favoriteData)
        }
    }
    
    func addFacility(fac: String) {
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else {return}
      //  let docRef = db.collection("Favorites").document(userID)
            
        var readFacilitiesSet = Set(readFacilities)
        readFacilitiesSet.insert(fac)
        readFacilities=Array(readFacilitiesSet)
        
        db.collection("Favorites").document(userID).setData(["userFavorites": self.readFacilities])
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        //Now, write readFacilities out to firebase
  
    }
}
