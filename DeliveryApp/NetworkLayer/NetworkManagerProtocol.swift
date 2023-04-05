import Foundation

protocol NetworkManagerProtocol {
    func requestAPI(completion: @escaping ((Result<[PizzaModel], Error>) -> Void))
}

final class NetworkManager: NetworkManagerProtocol {


    // https://pizza-and-desserts.p.rapidapi.com/pizzas/?rapidapi-key=23c288f5b7msh2753ff65417e243p14c548jsne92298c6e04a
    // https://pizza-and-desserts.p.rapidapi.com/pizzas/?rapidapi-key=94a584cb4fmsh1da7d8190dfb0e9p1347a2jsn463905b187a3

    func requestAPI(completion: @escaping ((Result<[PizzaModel], Error>) -> Void)) {
        guard let url = URL(string: "https://pizza-and-desserts.p.rapidapi.com/pizzas/?rapidapi-key=94a584cb4fmsh1da7d8190dfb0e9p1347a2jsn463905b187a3") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else { return }

            do {
                let data = try JSONDecoder().decode([PizzaModel].self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }

}
