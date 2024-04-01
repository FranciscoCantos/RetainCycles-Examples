import Foundation

class TestRepository {
    
    func doRepositoryThing(completion: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            completion()
            guard let self = self else { return }
            self.finishDoRepositoryThing()
        }
    }
    
    private func finishDoRepositoryThing() {
        print("FINISH - doRepositoryThing 4️⃣")
    }
    
    deinit {
        print("DEALLOC ❌ TestRepository ")
    }
}
