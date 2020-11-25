//
//  AuthService.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

let DB_BASE = Firestore.firestore()


class AuthService {
    
    //MARK: PROPERTIES
    static let instance = AuthService()
    
    private var REF_USERS = DB_BASE.collection("users")
    
    //MARK: FUNCTIONS
    func logInUserToFirebase(credential: AuthCredential, handler: @escaping (_ providerID: String?, _ isError: Bool, _ isNewUser: Bool?, _ userID: String?) -> ()){
        Auth.auth().signIn(with: credential) { (result, error) in
            // Check for errors
            if error != nil {
                print("Error logging in to Firebase")
                handler(nil, true, nil, nil)
                return
            }
            // Check for provider ID
            guard let providerID = result?.user.uid else {
                print("Error getting provider ID")
                handler(nil, true, nil, nil)
                return
            }
            
            self.checkIfUserExistsInDatabase(providerID: providerID) { (returnedUserID) in
                if let userID = returnedUserID{
                    handler(providerID, false, false, userID)
                    return
                }else{
                    handler(providerID, false, true, nil)
                    return
                }
            }
        }
    }
    
    
    //MARK: PRIVATE FUNCTIONS
    private func checkIfUserExistsInDatabase(providerID: String, handler: @escaping (_ existingUserID: String?) -> ()) {
        // If a userID is returned, then the user does exist in our database
        REF_USERS.whereField(DatabaseUserField.providerID, isEqualTo: providerID).getDocuments{(querySnapshot, error) in
            if let snapshot = querySnapshot, snapshot.count > 0, let document = snapshot.documents.first{
                let existingUserID = document.documentID
                handler(existingUserID)
            }else{
                //ERROR NEW USER
                handler(nil)
                return
            }
        }
    }
    
    
    
}
