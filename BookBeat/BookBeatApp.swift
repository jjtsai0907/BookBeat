import SwiftUI

@main
struct BookBeatApp: App {
    var body: some Scene {
        WindowGroup {
            CategoryListView(viewModel: DefaultCategoryListViewModel(bookManager: DefaultBookManager(service: DefaultBookService())))
        }
    }
}
