import Foundation

class ViewControllersFactory {
    static func createMainViewController() -> MainViewController {
        return MainViewController()
    }
    
    static func createTestViewController() -> TestViewController {
        return TestViewController(presenter: TestPresenter(interactor: TestInteractor(repository: TestRepository())))
    }
}
