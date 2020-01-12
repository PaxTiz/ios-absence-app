//
//  AbsenceModal.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 12/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct AbsenceModal: View {
	
    @Environment(\.presentationMode) var presentationMode
	private var semester: Int
	
	init(semester: Int) {
		self.semester = semester
	}
	
    var body: some View {
        VStack {
			Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			}) {
				Text("Dismiss")
			}.padding(.bottom, 50)
			Text("This is a modal")
		}
    }
	
}

struct AbsenceModal_Previews: PreviewProvider {
    static var previews: some View {
        AbsenceModal(semester: 1)
    }
}
