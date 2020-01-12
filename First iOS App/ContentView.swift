//
//  ContentView.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 11/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selection = 0
	private let semesters: [Semester] = [
		Semester(id: 1, materials: [
			Material(name: "SE", totalHours: 45),
			Material(name: "PWEB", totalHours: 60),
			Material(name: "Anglais", totalHours: 45),
		]),
		Semester(id: 2, materials: [
			Material(name: "SE2", totalHours: 45),
			Material(name: "Orga", totalHours: 60),
			Material(name: "Anglais", totalHours: 45),
		]),
		Semester(id: 3, materials: [
			Material(name: "SE3", totalHours: 45),
			Material(name: "PWEB", totalHours: 60),
			Material(name: "GSI", totalHours: 45),
		]),
		Semester(id: 4, materials: [
			Material(name: "RX3", totalHours: 45),
			Material(name: "PWEB2", totalHours: 60),
			Material(name: "ProgMobile", totalHours: 45),
		])
	]
	
	private var actionSheet: ActionSheet = ActionSheet(
		title: Text("test"),
		message: Text("action sheet")
	)
	
	@State private var materialAction: Bool = false
	@State var absenceAction: Bool = false
	
	var body: some View {
		
		NavigationView {
			TabView(selection: $selection) {
				
				ForEach(semesters, id: \.self) { sm in
					Home(semester: sm).tabItem {
						Image(systemName: "\(sm.identifier).circle")
						Text("Semestre " + String(sm.identifier))
					}.tag(sm.identifier - 1)
				}
				
			}.navigationBarTitle("Absences", displayMode: .inline)
				.navigationBarItems(
					leading: Button(action: {
						// TODO : Affcher une action sheet pour ajouter une matière dans le semestre courant
						self.materialAction = true
					}){
						Image(systemName: "plus").foregroundColor(Color.blue)
						Text("Matière")
					}.sheet(isPresented: $materialAction) {
						MaterialModal(semester: self.selection)
					},
					trailing: Button(action: {
						self.absenceAction.toggle()
					}) {
						Image(systemName: "plus").foregroundColor(Color.blue)
						Text("Absence")
					}.sheet(isPresented: $absenceAction) {
						AbsenceModal(semester: self.selection)
					}
			)
		}
		
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
