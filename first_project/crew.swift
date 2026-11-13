//
//  crew.swift
//  first_project
//
//  Created by Mian Faseeh on 13/11/2026.
//

import Foundation

struct crewRoll : Codable {
    let name: String
    let role: String
}

struct Mission : Identifiable, Codable {
    let id : Int
    let crew : [crewRoll]
    let launchDate: String?
    let description: String

}
