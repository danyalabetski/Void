import UIKit

protocol TabBarRouterProtocol {
    
}

final class TabBarRouter {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let view = TabBarViewController()
        let presenter = TabBarPresenter(view: view, mainRouter: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}

extension TabBarRouter: TabBarRouterProtocol {
    
}
