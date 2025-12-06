protocol Networking {
    func request<T: Decodable>(urlString: String, as type: T.Type) async throws -> T
}
