import SwiftUI

struct CategoryCellView: View {
    let category: Category
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                StandardImageView(imageString: category.image)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .clipped()

                Text(category.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    let loading = Category(
        id: 123,
        image: "http://10.255.255.1/image.jpg",
        title: "Loading",
        links: .mock
    )
    let failed = Category(
        id: 123,
        image: "invalidImageURLURL",
        title: "failed",
        links: .mock
    )

    Group {
        CategoryCellView(category: loading) {}
        CategoryCellView(category: Category.mock) {}
        CategoryCellView(category: failed) {}
    } .padding()
}
