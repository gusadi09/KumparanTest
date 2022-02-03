//
//  ContentView.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import SwiftUI

struct PostListView: View {
	var body: some View {
		ZStack {
			List(0...3, id: \.self) { item in

				Button {
					print("\(item)")
				} label: {
					PostCardView()
						.padding(.vertical, 10)
				}
				.buttonStyle(PlainButtonStyle())

			}
			.listStyle(PlainListStyle())
		}
		.navigationTitle(KTLocalizable.postListViewNavigationTitle)
		.navigationBarTitleDisplayMode(.large)
	}
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
		PostListView()
    }
}
