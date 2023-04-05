import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func updateData()
}

final class MainViewController: UIViewController {

    // MARK: - Properties

    var presenter: MainPresenter?

    // MARK: Public
    // MARK: Private

    private let tableView = UITableView()

    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupTableView()
        setupCostraints()        
    }

    // MARK: - Setups
    
    private func setupLeftBarButtomItem() -> UIBarButtonItem {
        let dropDownButtonItem = UIBarButtonItem(title: "Москва", image: UIImage(systemName: "chevron.down"), target: self, action: nil)
        return dropDownButtonItem
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.showsVerticalScrollIndicator = false

        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.shared)
        tableView.register(TableViewHeaderBaner.self, forHeaderFooterViewReuseIdentifier: TableViewHeaderBaner.shared)
        tableView.register(TableViewHeaderСlassification.self, forHeaderFooterViewReuseIdentifier: TableViewHeaderСlassification.shared)

        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupCostraints() {}

    // MARK: - Helpers
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeaderBaner.shared) as? TableViewHeaderBaner
            return header
        case 1:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeaderСlassification.shared) as? TableViewHeaderСlassification
            return header
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 112
        case 1:
            return 80
        default:
            return 0
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return presenter?.arrayPizza?.count ?? 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.shared, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let data = presenter?.arrayPizza?[indexPath.row]
        
        cell.setupUIData(image: data?.img ?? "", name: data?.name ?? "", description: data?.description ?? "", price: data?.price ?? 0)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}

extension MainViewController: MainViewControllerProtocol {
    func updateData() {
        tableView.reloadData()
    }
}
