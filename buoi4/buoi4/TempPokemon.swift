//
//  TempPokemon.swift
//  buoi4
//
//  Created by TuanAnh on 19/12/24.
//

import Foundation
struct TempPokemon : Codable{
    let id :Int
    let name:String
    let types : [String]
    let hp :Int
    let attack :Int
    let specialAttack : Int
    let speicialDefense :Int
    let speed :Int
    let sprite :URL
    let shiny :URL
    
    enum PokemonKeys :String,CodingKeys{
        
    }
}
