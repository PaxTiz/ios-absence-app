//
//  Home.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 11/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

func sortByUE(materials: [Material]) -> [[Material]] {
	var tab: [[Material]] = [[], []]
	
	materials.forEach { elem in
		if elem.ue == UE.info {
			tab[0].append(elem)
		} else if elem.ue == UE.general {
			tab[1].append(elem)
		}
	}
	
	return tab
}

struct Home: View {
	
	@State private var offset: CGFloat = 600

	private var current: Semester
	private var info: [[Material]]
	private var general: [[Material]]

	init(semester: Semester) {
		current = semester
		let materials = sortByUE(materials: semester.materials)
		info = materials[0].to2d() as! [[Material]]
		general = materials[1].to2d() as! [[Material]]
	}

    var body: some View {
		NavigationView {
			ZStack {
				ScrollView {
					HStack {
						Text("Semestre \(current.identifier)")
							.font(.system(size: 38))
							.fontWeight(.bold)
							.frame(maxWidth: .infinity, alignment: .leading)
						
						Image(systemName: "plus.circle")
							.font(.custom("", size: 28))
							.onTapGesture {
								withAnimation {
									if self.offset == 600 {
										self.offset = 300
									} else {
										self.offset = 600
									}
								}
						}
					}
					
					MaterialUE(viewTitle: "Matières informatiques", materials: self.info)
					Spacer()
					MaterialUE(viewTitle: "Matières générales", materials: self.general)
				}.padding()
					.navigationBarTitle("")
					.navigationBarHidden(true)
					.edgesIgnoringSafeArea(.bottom)
				
				MaterialSheet(offsetSize: self.$offset)
					.padding(.all, 20)
					.background(Color.init(red: 0.92, green: 0.92, blue: 0.92))
					.offset(y: self.offset)
					.edgesIgnoringSafeArea(.vertical)
			}
		}
	}
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
		Home(semester: Semester(id: 1, materials: [
			Material(name: "SE", totalHours: 45, ue: UE.info),
			Material(name: "PWEB", totalHours: 60, ue: UE.info),
			Material(name: "SE2", totalHours: 45, ue: UE.info),
			Material(name: "Anglais", totalHours: 45, ue: UE.general),
		]))
    }
}
