//
//  MaterialSheet.swift
//  Absences
//
//  Created by Valentin Cernuta on 11/04/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct MaterialSheet: View {
	
	@Binding var offsetSize: CGFloat
	@State private var material: String = ""
	@State private var hours: String = ""
	
    var body: some View {
		VStack(alignment: .leading) {
			TextField("Matière", text: self.$material)
			.textFieldStyle(RoundedBorderTextFieldStyle())
			
			TextField("Nombre d'heures max", text: self.$hours)
			.textFieldStyle(RoundedBorderTextFieldStyle())
				.keyboardType(.numberPad)
			
			HStack {
				Button(action: {
					
				}) {
					Text("Créer")
				}.padding([.top, .bottom], 10).padding([.leading, .trailing], 30)
					.background(Color.blue)
					.foregroundColor(Color.white)
					.cornerRadius(5)
				
				Button(action: {
					withAnimation {
						self.offsetSize = 600
					}
				}) {
					Text("Annuler")
				}.padding([.top, .bottom], 10).padding([.leading, .trailing], 30)
					.background(Color.orange)
					.foregroundColor(Color.white)
					.cornerRadius(5)
			}
			Spacer()
			
		}.frame(height: 100).padding()
	}
}

//struct MaterialSheet_Previews: PreviewProvider {
//    static var previews: some View {
//		MaterialSheet(material: "", hours: "", isPrensented: false)
//    }
//}
