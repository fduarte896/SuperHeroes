//
//  SuperHeroesViewModel.swift
//  SuperHeroes
//
//  Created by Felipe Duarte on 6/05/24.
//

import Foundation

///El cerebro de la vista para que le diga qué pintar. Va a tener la lógica.
///Es una clase para la lógica.
class SuperHeroesViewModel : ObservableObject { //Será observada desde fuera.
    @Published var arrayHeroes : [HeroesModelo] = [] ///Guardamos los heroes cuando los recojamos. ´@Published´ cuando nuestro array tenga cualquier cambio, mandará una señal y todos los que la observan se actualizará.
    
    //Init se ejecuta cuando se instancia la clase. Primero, llamar la función para recoger los heroes.
    init() {
        getHeroes()
    }
    
    func getHeroes(){
        arrayHeroes = getSuperHeroes()
    
    }
    
    func borrarHeroe(){ //Borrar el primer heroe del array.
        print(arrayHeroes.count)
        arrayHeroes.removeFirst()
        print(arrayHeroes.count)
    }
}
