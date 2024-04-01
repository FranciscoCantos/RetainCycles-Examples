import Foundation

class TestPresenter {
    private let interactor: TestInteractor
    
    init(interactor: TestInteractor) {
        self.interactor = interactor
    }
    
    func doPresenterThing(completion: @escaping ()->()) {
        interactor.doInteractorThing { [weak self] in
            completion()
            guard let self = self else { return }
            self.finishDoPresenterThing()
        }
    }
    
    private func finishDoPresenterThing() {
        print("FINISH - doInteractorThing 3️⃣")
    }
    
    deinit {
        print("DEALLOC ❌ TestPresenter")
    }
}
