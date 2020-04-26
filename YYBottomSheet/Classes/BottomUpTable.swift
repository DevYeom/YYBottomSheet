//
//  BottomUpTable.swift
//  Pods
//
//  Created by DevYeom on 04/06/2019.
//

import UIKit

@available(iOS 11.0, *)
open class BottomUpTable: UIViewController {

    public typealias SelectHandler = (BottomUpTableCell) -> ()

    // MARK: - Static Constants

    private static let HeaderViewWidth: CGFloat = UIScreen.main.bounds.size.width
    private static let HeaderViewHeight: CGFloat = 45
    private static let TableViewWidth: CGFloat = UIScreen.main.bounds.size.width
    private static let TableViewHeight: CGFloat = 250
    private static let TableRowHeight: CGFloat = 45
    private static let HeaderViewBackgroundColor: UIColor = UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
    private static let TableViewBackgroundColor: UIColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0)
    private static let HeaderViewTitleLabelTextColor: UIColor = UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1.0)
    private static let TableViewCellLabelTextColor: UIColor = UIColor(red: 85 / 255, green: 85 / 255, blue: 85 / 255, alpha: 1.0)
    private static let ShowDuration: Double = 0.3
    private static let HideDuration: Double = 0.3
    private static let BackgroundAlpha: CGFloat = 0.5

    // MARK: - Properties

    private var backgroundView: UIView!
    private var contentView: UIView!
    private var headerView: UIView!
    private var headerViewTitleLabel: UILabel!
    private var headerViewCloseButton: UIButton!
    private var tableView: UITableView!

    private var headerViewWidth: CGFloat = BottomUpTable.HeaderViewWidth
    private var headerViewHeight: CGFloat = BottomUpTable.HeaderViewHeight
    public var selectHandler: SelectHandler?
    public var tableViewWidth: CGFloat = BottomUpTable.TableViewWidth
    public var tableViewHeight: CGFloat = BottomUpTable.TableViewHeight
    public var tableRowHeight: CGFloat = BottomUpTable.TableRowHeight
    public var tableViewCellLabelTextColor: UIColor = BottomUpTable.TableViewCellLabelTextColor
    public var headerViewTitle: String = ""

    public var dataArray: [String] = [] // data array to show in the table view

    // outside touch gesture
    public var tapOutsideTouchGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()

    // MARK: - Customizable Properties

    public var allowTouchOutsideToDismiss: Bool = true {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                if allowTouchOutsideToDismiss == true {
                    weakSelf.tapOutsideTouchGestureRecognizer.addTarget(weakSelf, action: #selector(BottomUpTable.dismissView))
                } else {
                    weakSelf.tapOutsideTouchGestureRecognizer.removeTarget(weakSelf, action: #selector(BottomUpTable.dismissView))
                }
            }
        }
    }

    public var backgroundAlpha: CGFloat = BottomUpTable.BackgroundAlpha {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.backgroundView.alpha = backgroundAlpha
            }
        }
    }

    public var headerViewBackgroundColor: UIColor = BottomUpTable.HeaderViewBackgroundColor {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.headerView.backgroundColor = headerViewBackgroundColor
            }
        }
    }

    public var headerViewTitleLabelTextColor: UIColor = BottomUpTable.HeaderViewTitleLabelTextColor {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.headerViewTitleLabel.textColor = headerViewTitleLabelTextColor
            }
        }
    }

    public var tableViewSeperatorStyle: UITableViewCell.SeparatorStyle = .singleLine {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.tableView.separatorStyle = tableViewSeperatorStyle
            }
        }
    }

    public var tableViewBackgroundColor: UIColor = BottomUpTable.TableViewBackgroundColor {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.tableView.backgroundColor = tableViewBackgroundColor
            }
        }
    }

    // MARK: - Initialization

    init?(title: String, dataArray: Array<String>?, completion selectHandler: @escaping SelectHandler) {
        super.init(nibName: nil, bundle: nil)

        if windowNotReady() {
            return nil
        }

        self.headerViewTitle = title
        self.selectHandler = selectHandler

        if let dataArray = dataArray {
            self.dataArray = dataArray
        } else {
            self.dataArray = []
        }

        self.setupViews()
        self.setupAutoLayout()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // Cannot use when windows is nil
    private func windowNotReady() -> Bool {
        if UIApplication.shared.windows.isEmpty {
            #if DEBUG
            print("YYBottomSheet Error ::: It can't initialize BottomUpTable. Because the application has no window.")
            #endif
        }
        return UIApplication.shared.windows.isEmpty
    }

    private func setupViews() {
        // Setup Gesture
        if allowTouchOutsideToDismiss == true {
            self.tapOutsideTouchGestureRecognizer.addTarget(self, action: #selector(BottomUpTable.dismissView))
        }

        // Setup Background
        self.backgroundView = UIView(frame: self.view.bounds)
        self.backgroundView.addGestureRecognizer(self.tapOutsideTouchGestureRecognizer)
        self.backgroundView.backgroundColor = UIColor.black
        self.backgroundView.alpha = self.backgroundAlpha
        self.view.addSubview(self.backgroundView)

        // Setup ContentView
        self.contentView = UIView(frame: CGRect(x: 0, y: self.view.bounds.height - (self.tableViewHeight + self.headerViewHeight), width: self.view.bounds.width, height: self.tableViewHeight + self.headerViewHeight))

        // Setup HeaderView
        self.headerViewTitleLabel = UILabel.init()
        self.headerViewCloseButton = UIButton.init(type: .custom)
        self.headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.headerViewWidth, height: self.headerViewHeight))

        self.headerView.backgroundColor = BottomUpTable.HeaderViewBackgroundColor
        self.headerViewTitleLabel.text = self.headerViewTitle
        self.headerViewTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.headerViewTitleLabel.textColor = BottomUpTable.HeaderViewTitleLabelTextColor
        let closeButtonImage = UIImage(named: "close_button", in: Bundle(for: BottomUpTable.self), compatibleWith: nil)
        self.headerViewCloseButton.setImage(closeButtonImage, for: .normal)
        self.headerViewCloseButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        self.headerView.addSubview(self.headerViewTitleLabel)
        self.headerView.addSubview(self.headerViewCloseButton)
        self.contentView.addSubview(self.headerView)

        // Setup TableView
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.tableViewWidth, height: self.tableViewHeight), style: .plain)
        self.tableView.backgroundColor = self.tableViewBackgroundColor
        self.tableView.separatorStyle = self.tableViewSeperatorStyle
        self.tableView.register(BottomUpTableCell.self, forCellReuseIdentifier: BottomUpTableCell.identifierForTableViewCell)
        self.tableView.tableFooterView = UIView() // hide seperator lines where you don't have a data
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.contentView.addSubview(self.tableView)

        self.contentView.clipsToBounds = true
        self.view.addSubview(self.contentView)
    }

    private func setupAutoLayout() {
        // Use Autolayout
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.headerViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.headerViewCloseButton.translatesAutoresizingMaskIntoConstraints = false

        // BackgroundView
        self.backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        // ContentView
        self.contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.contentView.heightAnchor.constraint(equalToConstant: self.headerViewHeight).isActive = true

        // HeaderView
        self.headerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.headerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.headerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.headerView.heightAnchor.constraint(equalToConstant: self.headerViewHeight).isActive = true

        // HeaderViewTitleLabel
        self.headerViewTitleLabel.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor).isActive = true
        self.headerViewTitleLabel.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 16).isActive = true

        // HeaderViewCloseButton
        self.headerViewCloseButton.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor).isActive = true
        self.headerViewCloseButton.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -8).isActive = true
        self.headerViewCloseButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        self.headerViewCloseButton.widthAnchor.constraint(equalTo: self.headerViewCloseButton.heightAnchor).isActive = true

        // TableView
        self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }

    // MARK: - Life Cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func viewDidAppear(_ animated: Bool) {
        for constraint in self.contentView.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = self.headerViewHeight + self.tableViewHeight  // increase height to bottom-up animation
                break
            }
        }

        // bottom-up animation
        UIView.animate(withDuration: BottomUpTable.ShowDuration, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }

    // MARK: - BottomUpTable Usage

    public func show() {
        if windowNotReady() {
            return
        }

        self.modalPresentationStyle = .overFullScreen
        UIApplication.topViewController()?.present(self, animated: false, completion: nil)
    }

    @objc
    public func dismissView() {
        self.view.alpha = 1
        for constraint in self.contentView.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = self.headerViewHeight // decrease height to top-down animation
                break
            }
        }

        // top-down animation
        UIView.animate(withDuration: BottomUpTable.HideDuration, animations: {
            self.view.alpha = 0
            self.view.layoutIfNeeded()
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }

    // execute when selected cell
    public func selectCell(_ sender: BottomUpTableCell) {
        if let hanlder = self.selectHandler {
            hanlder(sender)
        }
    }
}

@available(iOS 11.0, *)
extension BottomUpTable: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableRowHeight
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BottomUpTableCell.identifierForTableViewCell, for: indexPath) as! BottomUpTableCell
        let row = indexPath.row

        cell.titleLabel.textColor = self.tableViewCellLabelTextColor
        cell.titleLabel.text = self.dataArray[row]

        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! BottomUpTableCell

        // assign indexPath selected cell
        cell.indexPath = indexPath

        // execute completion closure
        self.selectCell(cell)

        // dismissView and deselectRow
        self.dismissView()
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
