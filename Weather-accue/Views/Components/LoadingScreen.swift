//
//  LoadingScreen.swift
//  Weather-accue
//
//  Created by MacBookPro on 29/03/1946 Saka.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(Color.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
