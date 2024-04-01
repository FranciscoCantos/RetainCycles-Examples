import Foundation

class TestInteractor {
    private let repository: TestRepository
    
    init(repository: TestRepository) {
        self.repository = repository
    }
    
    func doInteractorThing(completion: @escaping ()->()) {
        repository.doRepositoryThing { [weak self] in
            completion()
            guard let self = self else { return }
            self.finishDoInteractorThing()
        }
    }
    
    private func finishDoInteractorThing() {
        print("FINISH - doInteractorThing 3️⃣")
    }
    
    deinit {
        print("DEALLOC ❌ TestInteractor ")
    }
}
