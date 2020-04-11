//
//  Grid.swift
//  Absences
//
//  Created by Valentin Cernuta on 11/04/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct Grid: View {
	
	private let materials: [[Material]]
	
	init(materials: [[Material]]) {
		self.materials = materials
	}
	
	func backgroundColor(hours: Int, max: Int) -> [Color] {
		if hours == max {
			// RED
			return [
				Color.init(red: 0.93, green: 0.13, blue: 0.23),
				Color.init(red: 0.58, green: 0.16, blue: 0.12)
			]
		} else if hours == max - 1 {
			// ORANGE
			return [
				Color.init(red: 0.96, green: 0.42, blue: 0.27),
				Color.init(red: 0.93, green: 0.66, blue: 0.29),
			]
		}
		
		// GREEN
		return [
			Color.init(red: 0.46, green: 0.72, blue: 0.32),
			Color.init(red: 0.55, green: 0.76, blue: 0.44)
		]
	}
	
    var body: some View {
        ForEach(self.materials, id: \.self) { array in
			HStack(spacing: 10) {
				ForEach(array, id: \.self) { mat in
					Card(material: mat)
						.padding()
						.background(
							RadialGradient(gradient:
								Gradient(
									colors: self.backgroundColor(hours: mat.absences, max: mat.maxAbsences)),
										   center: .center,
										   startRadius: 0,
										   endRadius: 180
						)).cornerRadius(10)
				}
			}
		}
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(materials: [
			[
				Material(name: "SE", totalHours: 45, ue: UE.info),
				Material(name: "PWEB", totalHours: 60, ue: UE.info),
			],
			[
				Material(name: "SE2", totalHours: 45, ue: UE.info),
				Material(name: "SE2", totalHours: 45, ue: UE.info),
			],
			[
				Material(name: "PWEB", totalHours: 45, ue: UE.info),
				Material(name: "Orga", totalHours: 60, ue: UE.general),
			],
			[
				Material(name: "Anglais", totalHours: 45, ue: UE.general),
				Material(name: "Anglais", totalHours: 45, ue: UE.general),
			]
	   ])
    }
}
