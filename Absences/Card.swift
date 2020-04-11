//
//  Card.swift
//  Absences
//
//  Created by Valentin Cernuta on 11/04/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct Card: View {
	
	private let material: Material
	
	init(material: Material) {
		self.material = material
	}
	
	var body: some View {
		VStack(spacing: 5) {
			HStack {
				Text(material.name)
					.font(.custom("Avenir Next Condensed", size: 22))
					.foregroundColor(Color.white)
				
				Spacer()
				
				Text(String(material.absences))
					.foregroundColor(Color.white)
					.font(.custom("Avenir Next Condensed", size: 22))
			}
			
			HStack {
				Image(systemName: "timer").foregroundColor(Color.white)
				Text("Restantes")
					.foregroundColor(Color.white)
					.font(.custom("Avenir Next Condensed", size: 20))
					.fontWeight(.medium)
				
				Spacer()
				
				Text(String(material.absences))
					.foregroundColor(Color.white)
					.font(.custom("Avenir Next Condensed", size: 22))
					.fontWeight(.medium)
			}
		}
	}
}
