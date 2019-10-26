//
//  BottomUpTableCell.swift
//  Pods
//
//  Created by DevYeom on 19/05/2019.
//

import UIKit

@available(iOS 10.0, *)
public class BottomUpTableCell: UITableViewCell {

    // MARK: - Static Constants
    static let identifierForTableViewCell: String = "BottomUpTableCell"

    // MARK: - Variables
    public var titleLabel: UILabel = UILabel.init()
    public var indexPath: IndexPath = IndexPath.init(row: 0, section: 0)

    // MARK: - Life Cycle
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // setup view
        self.titleLabel.font = UIFont.systemFont(ofSize: 16)
        self.titleLabel.textColor = UIColor(red: 100 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1.0)
        self.contentView.addSubview(self.titleLabel)

        // use autolayout
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
    }
}
