import Foundation

struct DefaultNetworkHelper: Networking {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func request<T: Decodable>(urlString: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }

        do {
            return try decoder.decode(type.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }

    private enum NetworkError: Error {
        case invalidURL(String)
        case invalidResponse
        case httpError(statusCode: Int)
        case decoding(Error)
    }
}
