
import SwiftUI

struct MasterView: View {
    @ObservedObject var viewModel = SuperHeroesViewModel()
    
//    let columnasFijas : [GridItem] = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))] ///Pasamos un array con 3 `GridItem` que determinan el número de columnas y el tamaño que van a tener estas
    
    let columnasFlexibles : [GridItem] = [GridItem(.flexible()) , GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columnasFlexibles, content: {
                    ForEach(viewModel.arrayHeroes){heroe in //la instancia ´viewmodel´
                        
                        NavigationLink{
                            HeroeDetailView(heroe: heroe)
                        } label:{
                            VStack{
                                Image(heroe.imagen)
                                    .resizable()
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .scaledToFill()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                
                                Text(heroe.apodo).bold().lineLimit(1).font(.footnote).foregroundColor(.black)
                                Text(heroe.nombreReal).lineLimit(1).font(.footnote).foregroundStyle(.gray)
                            }

                        }

                    }
                }

                )
                .padding()
                .navigationTitle("Súper Heroes")
                .font(.largeTitle)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        Button{
                            
                            viewModel.borrarHeroe()
                            
                        } label: {
                            Image(systemName: "trash.circle.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button{
                            print("Comparte")
                        } label: {
                            Image(systemName: "square.and.arrow.up.circle.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }

            }
        }
    }

#Preview {
    MasterView()
}
