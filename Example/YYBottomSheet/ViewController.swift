//
//  ViewController.swift
//  YYBottomSheet
//
//  Created by DevYeom on 05/19/2019.
//  Copyright (c) 2019 DevYeom. All rights reserved.
//

import UIKit
import YYBottomSheet

class ViewController: UIViewController {
	@IBOutlet weak var selectedFruitLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func showBottomSheet(_ sender: UIButton) {
		let title = "Fruits"
		let dataArray = ["apple", "grape", "watermelon", "banana", "strawberry", "cherry", "pineapple", "pear"]

		let bottomSheet = YYBottomSheet.init(title: title, dataArray: dataArray) { (cell) in
			self.selectedFruitLabel.text = cell.titleLabel.text
		}

		/* Customizable Variables
		bottomSheet.allowTouchOutsideToDismiss = false // default: true
		bottomSheet.tableViewHeight = 100 // default: 250
		bottomSheet.tableRowHeight = 30 // default: 45
		bottomSheet.backgroundAlpha = 0.3 // default: 0.5
		bottomSheet.headerViewTitleLabelTextColor = UIColor.red
		bottomSheet.headerViewBackgroundColor = UIColor.yellow
		bottomSheet.tableViewCellLabelTextColor = UIColor.blue
		*/

		bottomSheet.show()
	}
}

