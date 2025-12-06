import SwiftUI

struct CategoryCellView: View {
    let category: Category
    let onTap: () -> Void

    private var imageURL: URL? {
        URL(string: category.image)
    }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        imageView(image)
                    case .failure:
                        placeholderImage
                    case .empty:
                        loadingView
                    @unknown default:
                        placeholderImage
                    }
                }
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

    private func imageView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFill()
    }

    private var placeholderImage: some View {
        Image("bookBeatLogo")
            .resizable()
            .scaledToFill()
    }

    private var loadingView: some View {
        ZStack {
            Color(.secondarySystemBackground)
            ProgressView()
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
