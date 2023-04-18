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
    @Published private(set) var readFacilities = [String]()
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor
    func fetchData() async {
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
    }
    
    func addFacility(fac: String) {
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else {return}
            
//        var readFacilitiesSet = Set(readFacilities)
//        readFacilitiesSet.insert(fac)
//        readFacilities=Array(readFacilitiesSet)
        
        db.collection("Favorites").document(userID).updateData([
            "userFavorites": FieldValue.arrayUnion([fac])])
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
