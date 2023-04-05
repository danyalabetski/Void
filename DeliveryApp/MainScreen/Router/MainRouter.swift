import UIKit

protocol MainRouterProtocol {
    
}

final class MainRouter {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let view = MainViewController()
        view.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Москва", image: UIImage(systemName: "chevron.down"), target: self, action: nil)
        let presenter = MainPresenter(view: view, mainRouter: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}
