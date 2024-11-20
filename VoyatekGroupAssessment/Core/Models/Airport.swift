//
//  Country.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import Foundation

struct Airport: Codable {
    let name: String
    let city: String
    let code: String
    let image: String
    
    static let airports = [
        Airport(name: "Murtala Muhammed International Airport", city: "Lagos", code: "LO", image: "nigerian-flag"),
        Airport(name: "Nnamdi Azikiwe International Airport", city: "Abuja", code: "AB", image: "nigerian-flag"),
        Airport(name: "Port Harcourt International Airport", city: "Port Harcourt", code: "PH", image: "nigerian-flag"),
        Airport(name: "Akanu Ibiam International Airport", city: "Enugu", code: "EN", image: "nigerian-flag"),
        Airport(name: "Mallam Aminu Kano International Airport", city: "Kano", code: "KA", image: "nigerian-flag"),
        Airport(name: "Ajao Airport", city: "Ibadan", code: "IB", image: "nigerian-flag"),
        Airport(name: "Sani Abacha International Airport", city: "Kano", code: "KJ", image: "nigerian-flag"),
        Airport(name: "Kaduna International Airport", city: "Kaduna", code: "KD", image: "nigerian-flag"),
        Airport(name: "Bola Tinubu International Airport", city: "Lagos", code: "LA", image: "nigerian-flag"),
        Airport(name: "Osubi Airstrip", city: "Warri", code: "OS", image: "nigerian-flag"),
        Airport(name: "Benin Airport", city: "Benin City", code: "BN", image: "nigerian-flag"),
        Airport(name: "Yola International Airport", city: "Yola", code: "YO", image: "nigerian-flag"),
        Airport(name: "Makurdi Airport", city: "Makurdi", code: "MK", image: "nigerian-flag"),
        Airport(name: "Minna Airport", city: "Minna", code: "MI", image: "nigerian-flag"),
        Airport(name: "Ilorin International Airport", city: "Ilorin", code: "IL", image: "nigerian-flag"),
        Airport(name: "Calabar International Airport", city: "Calabar", code: "CB", image: "nigerian-flag"),
        Airport(name: "Asaba Airport", city: "Asaba", code: "AB", image: "nigerian-flag"),
        Airport(name: "Uyo International Airport", city: "Uyo", code: "UY", image: "nigerian-flag"),
        Airport(name: "Zaria Airport", city: "Zaria", code: "ZA", image: "nigerian-flag"),
        Airport(name: "Jos Airport", city: "Jos", code: "JO", image: "nigerian-flag")
    ]
}
