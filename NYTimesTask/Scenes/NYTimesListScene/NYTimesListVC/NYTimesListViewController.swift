//
//  NYTimesListViewController.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit

class NYTimesListViewController: UIViewController {

    //MARK:- IB Outlets
    @IBOutlet weak var tblNyTimeList: UITableView!
    
    //MARK:- Properties
    private var viewModel : NYTimesListViewModelProtocol!
    //MARK:- Initializer
    init(viewModel : NYTimesListViewModelProtocol) {
        super.init(nibName: String.init(describing: NYTimesListViewController.self), bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTBlList()
        bindValues()
        viewModel.getMostPopular()
    }

    //MARK:- Configuration
    private func configureTBlList() -> Void {
        tblNyTimeList.register(cell: NYTimesListCell.self)
        tblNyTimeList.delegate = self
        tblNyTimeList.dataSource = self
    }
    private func bindValues() -> Void {
        viewModel.mostPopular.bind(to: self, setter: {strongSelf , _ in strongSelf.tblNyTimeList.reloadData()})
    }
    //MARK:- Private helpers


}

//MARK:- table data Sources
extension NYTimesListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.mostPopular.value.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NYTimesListCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(item: viewModel.mostPopular.value[indexPath.section] )
        return cell
    }

}

//MARK:- table Delegate Methods
extension NYTimesListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = viewModel.mostPopular.value[indexPath.section]
        let vc = NYTimesDetailMaker.make(withItem: selectedItem)
        show(vc, sender: nil)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vi = UIView.init()
        vi.backgroundColor = .clear
        return vi
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vi = UIView.init()
        vi.backgroundColor = .clear
        return vi
    }
}
