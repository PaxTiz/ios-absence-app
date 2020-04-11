//
//  MaterialUE.swift
//  Absences
//
//  Created by Valentin Cernuta on 11/04/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct MaterialUE: View {
	
	private let viewTitle: String
	private let materials: [[Material]]
	
	init(viewTitle: String, materials: [[Material]]) {
		self.viewTitle = viewTitle
		self.materials = materials
	}
	
    var body: some View {
		VStack {
			// Affichage des matières informatiques
			VStack(spacing: 10) {
				Text("Matières informatiques")
					.font(.system(size: 32))
					.fontWeight(.bold)
					.frame(maxWidth: .infinity, alignment: .leading)
				
				// Grille avec toutes les matières
				ForEach(self.materials, id: \.self) { array in
					HStack(spacing: 10) {
						ForEach(array, id: \.self) { mat in
							Card(material: mat)
								.padding()
								.background(
									RadialGradient(gradient:
										Gradient(
											colors: [Color.init(red: 0.46, green: 0.72, blue: 0.32), Color.init(red: 0.55, green: 0.76, blue: 0.44)]),
												   center: .center,
												   startRadius: 0,
												   endRadius: 180
								)).cornerRadius(10)
						}
					}
				}
			}
		}.padding(.top, 10)
    }
}

struct MaterialUE_Previews: PreviewProvider {
    static var previews: some View {
		MaterialUE(viewTitle: "Semestre 1", materials: [
			[Material(name: "SE", totalHours: 45, ue: UE.info),
			Material(name: "PWEB", totalHours: 60, ue: UE.info),],
			[Material(name: "SE2", totalHours: 45, ue: UE.info),
			Material(name: "SE2", totalHours: 45, ue: UE.info),],
			[Material(name: "PWEB", totalHours: 45, ue: UE.info),
			Material(name: "Orga", totalHours: 60, ue: UE.general),],
			[Material(name: "Anglais", totalHours: 45, ue: UE.general),
			Material(name: "Anglais", totalHours: 45, ue: UE.general),]
		])
    }
}
