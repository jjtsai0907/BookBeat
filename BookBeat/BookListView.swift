import SwiftUI

struct BookListView: View {
    @State var viewModel: BookListViewModel
    var body: some View {
        Text(viewModel.category.title)
    }
}

#Preview {
    BookListView(viewModel: MockBookListViewModel())
}
