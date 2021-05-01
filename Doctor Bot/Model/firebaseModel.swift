//
//  firebaseModel.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 01/05/21.
//

import Foundation
struct Welcome: Decodable {
    let users: Users
    let appointment: Appointment
    let diagnosis: Diagnosis

    enum CodingKeys: String, CodingKey {
        case users = "Users"
        case appointment, diagnosis
    }
}

// MARK: - Appointment
struct Appointment: Decodable {
    let apid: Apid
}

// MARK: - Apid
struct Apid: Decodable {
    let date, doctor, uid: String
}

// MARK: - Diagnosis
struct Diagnosis: Decodable {
    let did: Did
}

// MARK: - Did
struct Did: Decodable {
    let diagnose, type, uid: String
}

// MARK: - Users
struct Users: Decodable {
    let uid: Uid
}

// MARK: - Uid
struct Uid: Decodable {
    let city, email, name: String
    let phone: Int
}
