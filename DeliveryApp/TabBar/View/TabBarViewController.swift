import UIKit

final class TabBarViewController: UITabBarController {
    
    var presenter: TabBarPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        tabBarAppearance()
    }

    private func generateTabBar() {        
        viewControllers = [
            generateVC(viewController: MainViewController(), title: "Меню", image: UIImage(systemName: "takeoutbag.and.cup.and.straw")),
            generateVC(viewController: UIViewController(), title: "Контакты", image: UIImage(systemName: "location.circle")),
            generateVC(viewController: UIViewController(), title: "Профиль", image: UIImage(systemName: "person.fill")),
            generateVC(viewController: UIViewController(), title: "Корзина", image: UIImage(systemName: "cart"))
        ]
    }

    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func tabBarAppearance() {
        let roundLayer = CAShapeLayer()
        roundLayer.fillColor = UIColor.mainColor.cgColor
        tabBar.tintColor = .tabBarItemAccent        
    }
    
}
