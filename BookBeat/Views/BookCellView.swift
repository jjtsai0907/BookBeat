import SwiftUI

struct BookCellView: View {
    let book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(book.title.isEmpty ? "No Title" : book.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)

            StandardImageView(imageString: book.image)
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    BookCellView(book: .mock)
}
