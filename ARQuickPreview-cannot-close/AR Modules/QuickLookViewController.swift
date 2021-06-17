//
//  QuickLookViewController.swift
//  natura-jenensis
//
//  Created by Laurent B on 16/06/2021.
//

import QuickLook
import SwiftUI
import UIKit

struct QuickLookPreview: View {
	@State private var showQuickLook = false
	@State private var selectedURL = Bundle.main.url(forResource: "cubeYellow", withExtension: "usdz")

	var body: some View {
		Image("cubeYellow")
			.resizable()
			.scaledToFit()
			.onTapGesture(perform: {
				showQuickLook = true
			})
		.fullScreenCover(isPresented: $showQuickLook) {
			ZStack(alignment: .topLeading) {
				QuickLookController(url: self.selectedURL!,isPresented: $showQuickLook)
				HStack {
					Button(action: {
						self.showQuickLook = false
					}, label: {
						Text("")

							.font(.largeTitle)
							.padding(.horizontal, 20)
							//.padding(.vertical, -15)
					})

				}
			}
			.ignoresSafeArea()
		}
		//			.sheet(isPresented: $showQuickLook, onDismiss: {
		//				self.showQuickLook = false
		//			}) {
		//				if  self.selectedURL != nil {
		//					QuickLookController(url: self.selectedURL!,isPresented: $showQuickLook)
		//				}
		//			}
	}
}


struct QuickLookController: UIViewControllerRepresentable {

	var url: URL
	//var onDismiss: () -> Void
	@Binding var isPresented: Bool

	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}

	func updateUIViewController(_ viewController: UINavigationController, context: UIViewControllerRepresentableContext<QuickLookController>) {
		if let controller = viewController.topViewController as? QLPreviewController {
			controller.reloadData()
		}
	}

	func makeUIViewController(context: Context) -> UINavigationController {
		let controller = QLPreviewController()

		controller.delegate = context.coordinator
		controller.dataSource = context.coordinator
		controller.navigationController?.setNavigationBarHidden(true, animated: false)
		controller.reloadData()

		controller.reloadData()

		let navController = UINavigationController(rootViewController: controller)
		print(navController.navigationItem.rightBarButtonItem)
		return navController
	}

	class Coordinator: NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
		var parent: QuickLookController

		init(_ qlPreviewController: QuickLookController) {
			self.parent = qlPreviewController
			super.init()
		}
		// this for the delegate
		func previewController(_ controller: QLPreviewController,
		   transitionViewFor item: QLPreviewItem) -> UIView? {
			let imageView = UIImageView()
			if let filePath = Bundle.main.path(forResource: "cubeYellow", ofType: "png"), let image = UIImage(contentsOfFile: filePath) {
				imageView.image = image
			}
			   return imageView
		}

		func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
			return 1
		}
		func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
			return self.parent.url as QLPreviewItem
		}

	}
}



struct QuickLookPreview_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			QuickLookPreview()

			QuickLookPreview()
				.preferredColorScheme(.dark)
		}
	}
}
