/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    // @State es un valor o conjunto de valores que pueden cambiar con el tiempo y afecta al comportamiento de la vista, contenido o diseño.
    //@State var showFavoritesOnly = false
    
    //Lo modificamos a true para el añadido del boton del filtrado de si queremos que aparezcan los favoritos o no. Y abajo añadimos el bucle ForEach, para combinar diferentes vistas dinámicas.
    @State var showFavoritesOnly = true
    
    var body: some View {
        NavigationView {
            List {
                // Con el toggle indicamos que cree la barra con el botón, con el mensaje para mostrar solo los favoritos.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
            ForEach (landmarkData) { landmark in
                if !self.showFavoritesOnly || landmark.isFavorite {
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
