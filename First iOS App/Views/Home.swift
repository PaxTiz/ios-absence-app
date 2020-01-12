//
//  Home.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 11/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct Home: View {
	
	private var current: Semester
	private var colors: [[Color]] = [
		// Vert
		[Color.init(red: 0.46, green: 0.72, blue: 0.32), Color.init(red: 0.55, green: 0.76, blue: 0.44)],
		// Rouge
		[Color.init(red: 0.56, green: 0.05, blue: 0), Color.init(red: 0.12, green: 0.11, blue: 0.09)],
		// Orange
		[Color.init(red: 1, green: 0.72, blue: 0.37), Color.init(red: 0.93, green: 0.56, blue: 0.01)],
	]
	
	init(semester: Semester) {
		current = semester
	}
 
    var body: some View {
		VStack(spacing: 10) {
			ForEach(current.materials, id: \.self) { ma in
				HStack(spacing: 10) {
					ForEach(0..<2) { x in
						VStack(alignment: .leading, spacing: 5) {
							HStack {
								Text(ma.name)
									.font(.custom("Avenir Next Condensed", size: 22))
									.foregroundColor(Color.white)
									
								Spacer()
								
								Text(String(ma.absences))
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
								
								Text(String(ma.absences))
									.foregroundColor(Color.white)
									.font(.custom("Avenir Next Condensed", size: 22))
									.fontWeight(.medium)
							}
						}.padding().background(
								RadialGradient(gradient:
									Gradient(
										colors: self.chooseColor(nb: ma.absences)),
											   center: .center, startRadius: 0, endRadius: 180
							)).cornerRadius(10)
					}
				}
			}
			Spacer()
		}
    }
	
	func chooseColor(nb: Int) -> [Color] {
		if nb == 0 {
			return self.colors[0]
		} else if nb > 0 && nb < 3 {
			return self.colors[2]
		}
		
		return self.colors[1]
	}
	
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
		Home(semester: Semester(id: 1, materials: [
			Material(name: "SE", totalHours: 45),
			Material(name: "PWEB", totalHours: 60),
			Material(name: "Anglais", totalHours: 45),
		]))
    }
}
