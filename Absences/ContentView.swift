//
//  ContentView.swift
//  Absences
//
//  Created by Valentin Cernuta on 15/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

extension Array {
	
	func to2d() -> [[Any]] {
		var tab2d: [[Any]] = []
		
		if self.count % 2 == 0 {
			for index in stride(from: 0, to: self.count, by: 2) {
				tab2d.append([self[index], self[index + 1]])
			}
		} else {
			for index in stride(from: 0, to: self.count - 2, by: 2) {
				tab2d.append([self[index], self[index + 1]])
			}
			tab2d.append([self.last!])
		}
		
		return tab2d
	}
	
}

struct ContentView: View {
    @State private var selection = 0
	
	private let semesters: [Semester] = [
		Semester(id: 1, materials: [
			Material(name: "SE", totalHours: 45, ue: UE.info),
			Material(name: "PWEB", totalHours: 60, ue: UE.info),
			Material(name: "SE2", totalHours: 45, ue: UE.info),
			Material(name: "SE2", totalHours: 45, ue: UE.info),
			Material(name: "PWEB", totalHours: 45, ue: UE.info),
			Material(name: "Orga", totalHours: 60, ue: UE.general),
			Material(name: "Anglais", totalHours: 45, ue: UE.general),
			Material(name: "Anglais", totalHours: 45, ue: UE.general),
		]),
		Semester(id: 2, materials: [
			Material(name: "SE2", totalHours: 45, ue: UE.info),
			Material(name: "PWEB", totalHours: 45, ue: UE.info),
			Material(name: "Orga", totalHours: 60, ue: UE.general),
			Material(name: "Anglais", totalHours: 45, ue: UE.general),
		]),
		Semester(id: 3, materials: [
			Material(name: "SE2", totalHours: 45, ue: UE.info),
			Material(name: "PWEB", totalHours: 60, ue: UE.info),
			Material(name: "GSI", totalHours: 45, ue: UE.general),
			Material(name: "Droit", totalHours: 45, ue: UE.general),
		]),
		Semester(id: 4, materials: [
			Material(name: "RX3", totalHours: 45, ue: UE.info),
			Material(name: "PWEB2", totalHours: 60, ue: UE.info),
			Material(name: "ProgMobile", totalHours: 45, ue: UE.info),
			Material(name: "Anglais", totalHours: 45, ue: UE.general),
		])
	]
 
    var body: some View {
        TabView(selection: $selection){
			ForEach(semesters, id: \.self) { semester in
				Home(semester: semester).tabItem {
					Image(systemName: "\(semester.identifier).circle")
					Text("Semestre " + String(semester.identifier))
				}.tag(semester.identifier - 1)
			}
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
