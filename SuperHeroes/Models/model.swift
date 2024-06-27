//
//  model.swift
//  SuperHeroes
//
//  Created by Felipe Duarte on 3/05/24.
//

import Foundation
import SwiftUI

struct HeroesModelo: Codable, Identifiable{
    
    var id: String
    let nombreReal: String
    let apodo: String
    let descripcion: String
    let edad: Int
    let poderes: [PoderesSuperheroes]
    let imagen: String
    
    enum CodingKeys: String, CodingKey{
    case id, nombreReal, apodo, edad, poderes, imagen, descripcion
    }
    
    enum ExtraKeys: String, CodingKey{
        case historia
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self) ///Aquí container es todos los casos que están dentro del `enum: CodingKeys`
        id = try container.decode(String.self, forKey: .id)
        nombreReal = try container.decode(String.self, forKey: .nombreReal)
        apodo = try container.decode(String.self, forKey: .apodo)
        edad = try container.decode(Int.self, forKey: .edad)
        poderes = try container.decode([PoderesSuperheroes].self, forKey: .poderes)
        imagen = try container.decode(String.self, forKey: .imagen)

        ///Para description entonces intentamos decodificarlo usando su clave original `description` pero si no funciona entonces que busque la clave `historia`.
        if let descripcionValue = try container.decodeIfPresent(String.self, forKey: .descripcion){
            descripcion = descripcionValue
        } else{
            ///Si no está la clave `descripcion` entonces buscamos `historia`. No se hace como en `descriptionValue` porque `historia` no está dentro dentro de `codingKeys`.
            ///Por lo tanto creamos otro contenedor que se base en `Extrakeys` y por tanto `historia` si pueda ser usado.
            let extraContainer = try decoder.container(keyedBy: ExtraKeys.self)
            descripcion = try extraContainer.decode(String.self, forKey: .historia)
        }
    }
}

func getSuperHeroes () -> [HeroesModelo]{
    let url = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json")!
    
    do {
        let data = try Data(contentsOf: url)
        let resultado = try JSONDecoder().decode([HeroesModelo].self, from: data)
        return resultado
    } catch  {
        print("error: \(error)")
    }
    return []
}

let funcion = getSuperHeroes()
