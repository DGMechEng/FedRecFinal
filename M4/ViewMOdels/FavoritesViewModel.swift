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
    private(set) var readFacilities = [String]()
    // var readFacilities = ["235752"]
 //   var readFacilities = [""]
    func updateFavorites() {
        self.fetchData()
        self.getFacilityInfo()
    }
    
    func fetchData()  {
        //Get reference to database
        let db = Firestore.firestore()
        
        //Get reference to user
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let docRef = db.collection("Favorites").document(userID)
 
           docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    self.readFacilities = data?["userFavorites"] as? [String] ?? []
                    let dataDescription = data.map(String.init(describing:)) ?? "nil"
                    print("Document data: \(dataDescription)") //None of this appears to be happening (based on console) until I return from fetchData.  Do I need to make a separate call somehow?
                 } else {
                    print("Document does not exist")
                }
            }
        
//          Abhi, I moved this for loop to the getFacilityInfo() method.  Now I'm calling that when the user clicks "Favorites".  Still doesn't work :-(
//        for facility in readFacilities {
//            Task {
//                await favorite.fetchData(facID: facility)
//            }
//            self.facilityData.append(favorite.favoriteData)
//            print(self.facilityData)
//        }
    }
    
    func getFacilityInfo() {
        for facility in readFacilities {
            Task {
                await favorite.fetchData(facID: facility)
            }
            self.facilityData.append(favorite.favoriteData)
            print(self.facilityData)
        }
    }
    
    func addFacility(fac: String) {
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else {return}
            
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
    }
    
    func removeFacility(fac: String) {
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else {return}
            
        var readFacilitiesSet = Set(readFacilities)
        if let removed = readFacilitiesSet.remove(fac) {
            print("\(removed) has been removed from favorites")
        }
        readFacilities=Array(readFacilitiesSet)
        
        db.collection("Favorites").document(userID).setData(["userFavorites": self.readFacilities])
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    

}
