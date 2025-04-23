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
    var hp :Int = 0
    var attack :Int = 0
    var specialAttack : Int = 0
    var speicialDefense :Int = 0
    var speed :Int = 0
    let sprite :URL
    let shiny :URL
    var defense :Int = 0
    enum PokemonKeys :String, CodingKey{
        case id
        case name
        case types
        case stats
        case sprites
        
        enum TypeDictionaryKeys:String, CodingKey{
            case type
            
            enum TypeKeys :String, CodingKey{
                case name
            }
        }
        enum StatDictionaryKeys :String, CodingKey{
            case value = "base_stat"
            case stat
            enum StatKeys :String, CodingKey{
                case name
            }
            
        }
        enum SpriteKeys : String, CodingKey{
            case sprite = "front_default"
            case shiny = "front_shiny"
            
        }
        
    }
    init(from decoder: any Decoder) throws {
       let container = try decoder.container(keyedBy: PokemonKeys.self)
        id = try container.decode(Int.self,forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        var decodedTypes:[String]=[]
        var typeContainer = try container.nestedUnkeyedContainer(forKey: .types)
        while !typeContainer.isAtEnd {
            let typeDictionaryContainer = try typeContainer.nestedContainer(keyedBy: PokemonKeys.TypeDictionaryKeys.self)
            let typeContainer = try typeDictionaryContainer.nestedContainer(keyedBy: PokemonKeys.TypeDictionaryKeys.TypeKeys.self, forKey: .type)
            
            let type = try typeContainer.decode(String.self, forKey: .name)
            decodedTypes.append(type)
        }
        types = decodedTypes
        var statsContainer = try container.nestedUnkeyedContainer(forKey: .stats)
        while !statsContainer.isAtEnd {
            let statsDictionaryContainer = try statsContainer.nestedContainer(keyedBy: PokemonKeys.StatDictionaryKeys.self)
            let statContainer = try statsDictionaryContainer.nestedContainer(keyedBy: PokemonKeys.StatDictionaryKeys.StatKeys.self, forKey: .stat)
            switch try statContainer.decode(String.self, forKey: .name) {
                case "hp":
                    hp = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                case "attack":
                     attack = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                case "defense":
                    defense = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                case "special-attack":
                    specialAttack = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                case "special-defense":
                    speicialDefense = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                case "speed":
                    speed = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                default:
                    print("It will never get here so ...")
                    
                
            }
        }
        let spirteContainer = try container.nestedContainer(keyedBy: PokemonKeys.SpriteKeys.self, forKey: .sprites)
        sprite = try spirteContainer.decode(URL.self, forKey: .sprite)
        shiny = try spirteContainer.decode(URL.self, forKey: .shiny)
        
    }
    
    
}
