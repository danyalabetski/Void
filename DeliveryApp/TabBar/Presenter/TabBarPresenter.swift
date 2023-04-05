final class TabBarPresenter {
    
    unowned let view: TabBarViewController
    private let mainRouter: TabBarRouter
    
    init(view: TabBarViewController, mainRouter: TabBarRouter) {
        self.view = view
        self.mainRouter = mainRouter
    }
}
