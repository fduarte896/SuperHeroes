//
//  HeroeDetailView.swift
//  SuperHeroes
//
//  Created by Felipe Duarte on 4/05/24.
//


//HACER ESTA VISTA COMO MODAL!


import SwiftUI

struct HeroeDetailView: View {
    ///Primero creamos una variable que sea del tipo `HeroesModelo` para poder acceder a sus propiedades.
    let heroe : HeroesModelo
    let gradiente = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 80/255, green: 88/255, blue: 107/255), // Color en RGB
            Color(red: 20/255, green: 27/255, blue: 43/255)  // Otro color en RGB
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    let colorNaranja = Color(red: 219/255, green: 124/255, blue: 122/255)
    let colorBarras =  Color(red: 80/255, green: 88/255, blue: 107/255)
   
//    let gradiente = LinearGradient(colors: [
//        Color(red: 80, green: 88, blue: 107),
//        Color(red: 20, green: 27, blue: 43)
//    ]),
//        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State private var barra = 100.0
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack{
                    Text("Detalles del personaje").foregroundStyle(.white).bold().font(.title2)
                    Image(heroe.imagen).resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                    HStack{ ///Stack de la zona media con foto altura y peso.
                        
                        VStack {
                            Text("Biografía").foregroundStyle(.white).bold().font(.title3)
                            Image(heroe.imagen).resizable().frame(width: 120, height: 120).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(colorNaranja, lineWidth: 4))
                        }
                        VStack{
                            Divider().background(.white)
                                HStack {
                                    Text("Altura").foregroundStyle(.white).padding(.leading)
                                    Spacer()
                                    Text("1.80 m").foregroundStyle(.white).padding(.horizontal).foregroundStyle(.white).background(colorNaranja).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).bold()
                                }

                            Divider().background(.white)
                            HStack {
                                Text("Peso").foregroundStyle(.white).padding(.leading)
                                Spacer()
                                Text("70 Kg").padding(.horizontal).foregroundStyle(.white).background(colorNaranja).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).bold()
                            }
                            Divider().background(.white)
                        }
                        
                    }
                    
                    Divider().background(.white)
                    CustomGauge(value: 100, maxValue: 100).padding(.vertical, 10)
                    
                    CustomGauge(value: 100, maxValue: 100).padding(.vertical, 10)

                    HStack{
                        Text(heroe.apodo).foregroundStyle(colorNaranja).bold()
                        Spacer()
                        Text("Edad: \(heroe.edad) años").foregroundStyle(.white)
                    }.padding(.top, 20)
                    Divider().background(.white)
                    Text(heroe.descripcion).foregroundStyle(colorNaranja)

                    Divider()
                    
                }.toolbar{
                    ToolbarItemGroup(placement: .status){

                        Button(action: {
                            print("Botón 1")
                        }, label: {
                            Image(systemName: "heart").font(.title).foregroundStyle(colorNaranja)
                        })

                        Button(action: {
                            print("Botón 2")
                        }, label: {
                            Image(systemName: "heart").font(.title).foregroundStyle(colorNaranja)
                        })
                        Button(action: {
                            print("Botón 3")
                        }, label: {
                            Image(systemName: "heart").font(.title).foregroundStyle(colorNaranja)
                        })
                        Button(action: {
                            print("Botón 4")
                        }, label: {
                            Image(systemName: "heart").font(.title).foregroundStyle(colorNaranja)
                        })
                        Button(action: {
                            print("Botón 5")
                        }, label: {
                            Image(systemName: "heart").font(.title).foregroundStyle(colorNaranja)
                        })
                    }
                }

            }.background(gradiente)
        }.padding(.horizontal).background(gradiente)

    }
}

#Preview {
    HeroeDetailView(heroe: funcion[0])
}


struct CustomGauge: View {
    var value: Double // Valor actual
    var maxValue: Double // Valor máximo
    var color: Color = Color(red: 80/255, green: 88/255, blue: 107/255)


    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 20)
                    .opacity(0.3)
                    .foregroundColor(color.opacity(0.3))

                Rectangle()
                    .frame(width: geometry.size.width * CGFloat(value / maxValue), height: 30)
                    .foregroundColor(color)
                    .animation(.linear, value: value)
            }
            .cornerRadius(10) // Suaviza los bordes de la barra de progreso
        }
    }
}

#Preview("Gauge") {
    CustomGauge(value: 100, maxValue: 100)
}
