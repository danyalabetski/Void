import Foundation

protocol MainPresenterProtocol {
    func getData()
}

final class MainPresenter {
    
    var arrayPizza: [PizzaModel]?
    unowned let view: MainViewControllerProtocol
    private let mainRouter: MainRouter
    var networkManagerProtocol: NetworkManagerProtocol?
    
    init(view: MainViewController, mainRouter: MainRouter) {
        self.view = view
        self.mainRouter = mainRouter
        self.networkManagerProtocol = NetworkManager()
    }
}

extension MainPresenter: MainPresenterProtocol {
    func getData() {
        networkManagerProtocol?.requestAPI(completion: { [weak self] pizzaData in
            switch pizzaData {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.arrayPizza = data
                    print(data)
                    self?.view.updateData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
