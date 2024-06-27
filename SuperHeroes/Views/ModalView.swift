
import SwiftUI

struct ModalView: View {
    let arrayHeroes = getSuperHeroes()
    let gradiente = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 80/255, green: 88/255, blue: 107/255), // Color en RGB
            Color(red: 20/255, green: 27/255, blue: 43/255)  // Otro color en RGB
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    ///Vamos a crear una variabe que nos guarde cuál heroe fue seleccionado para luego pasarlo en la `.sheet` y que esta muestre  el heroe que esté dentro de esta variable.
    @State private var heroeSeleccionado : HeroesModelo?
    @State private var estáPresenteSheet = false
    //    let columnasFijas : [GridItem] = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))] ///Pasamos un array con 3 `GridItem` que determinan el número de columnas y el tamaño que van a tener estas
    
    let columnasFlexibles : [GridItem] = [GridItem(.flexible()) , GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack{
            ///Tengo que hacer que cada heroe sea un botón con el siguiente modelo:
            ///`Button(){}.sheet(){navigationView{la vista que quiero mostrar}}
            ///`
            ScrollView{
                LazyVGrid(columns: columnasFlexibles, content: {
                    ForEach(arrayHeroes){heroe in
                        Button{
                            estáPresenteSheet = true
                            heroeSeleccionado = heroe
                            print(heroe.apodo)
                        }label: {
                            
                            VStack{
                                Image(heroe.imagen)
                                    .resizable()
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .scaledToFill()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                
                                Text(heroe.apodo).bold().lineLimit(1).font(.footnote).foregroundColor(.white)
                                Text(heroe.nombreReal).lineLimit(1).font(.footnote).foregroundStyle(.gray)
                            }
                        }
                    }
                    
                    
                })
                .padding()
                .navigationTitle("Súper Heroes")
                .font(.largeTitle)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        Button{
                            print("Guárdalos todos")
                        } label: {
                            Image(systemName: "trash.circle.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                    ToolbarItem(placement: .cancellationAction){
                        ShareLink(item: URL(string: "www.google.com")!) {
                            Image(systemName: "square.and.arrow.up.circle.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
//                        Button{
//                            print("Otro botón")
//                        } label: {
//                            Image(systemName: "square.and.arrow.up.circle.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        }
                    }
                }.sheet(isPresented: $estáPresenteSheet){
                    if let heroe = heroeSeleccionado{
                        NavigationView{
                            HeroeDetailView(heroe: heroe)}.presentationDetents([.medium, .large ,.fraction(0.75)])
                    }
                    
                }
                
            }.background(gradiente)
            
        }
    }
}


#Preview {
    ModalView()
}
