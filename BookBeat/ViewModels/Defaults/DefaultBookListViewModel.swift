import Foundation

@Observable
final class DefaultBookListViewModel: BookListViewModel {
    private(set) var category: Category

    init(category: Category) {
        self.category = category
    }
}
