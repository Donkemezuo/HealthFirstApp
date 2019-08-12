//
//  StarWarsAPIClient.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation



enum NetworkError: Error {
    case badURL
    case badStatusCode
    case apiError(Error)
    case jsonDecodingError(Error)
    case dataError(Error)
}

final class StarWarsAPIClient {
    private var nextPeopleDataQuery: String?
    private var nextPlanetsDataQuery: String?
    
    private func fetchPeopleData(fromRequest request: URLRequest, completionHandler: @escaping(Result<[PeopleDataWrapper], NetworkError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let error = error {
                completionHandler(.failure(.apiError(error)))
            } else if let data = data {
                do {
                    let peopleDataModel = try JSONDecoder().decode(PeopleData.self, from: data)
                    self.nextPeopleDataQuery = peopleDataModel.next
                    completionHandler(.success(peopleDataModel.results))
                    
                }catch {
                    completionHandler(.failure(.jsonDecodingError(error)))
                }
            }
        }
        
        dataTask.resume()
        
    }
     func makeNextQueryForPeopleData(completionHandler: @escaping (Result<[PeopleDataWrapper], NetworkError>) -> Void){
        
        guard let nextQueryURLString = nextPeopleDataQuery else {return }
        guard let nextQueryURL = URL(string: nextQueryURLString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        let nextRequest = URLRequest(url: nextQueryURL)
        fetchPeopleData(fromRequest: nextRequest, completionHandler: completionHandler)
    }
     func getPeopleData(completionHandler: @escaping(Result<[PeopleDataWrapper], NetworkError>) -> Void){
        
        let peopleEndPointURL = "https://swapi.co/api/people/"
        guard let url = URL(string: peopleEndPointURL) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)
     
        fetchPeopleData(fromRequest: urlRequest, completionHandler: completionHandler)
    }
    private func fetchPlanetsData(fromRequest request: URLRequest, completionHandler: @escaping(Result<[PlanetDataWrapper], NetworkError>) -> Void){
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.apiError(error)))
            } else if let data = data {
                do {
                    let planetsData = try JSONDecoder().decode(PlanetData.self, from: data)
                    self.nextPlanetsDataQuery = planetsData.next
                    completionHandler(.success(planetsData.results))
                } catch {
                    completionHandler(.failure(.jsonDecodingError(error)))
                }
            }
        }
        
        dataTask.resume()
        
    }
    func makeNextPlanetDataQuery(completionHandler: @escaping(Result<[PlanetDataWrapper], NetworkError>) -> Void){
        guard let nextPlanetDataQueryURLString = nextPlanetsDataQuery else {return}
        guard let nextPlanetDataQueryURL = URL(string: nextPlanetDataQueryURLString) else {
            completionHandler(.failure(.badURL))
            return
        }
        let nextPlanetDataRequest = URLRequest(url: nextPlanetDataQueryURL)
        fetchPlanetsData(fromRequest: nextPlanetDataRequest, completionHandler: completionHandler)
    }
    func getPlanetsData(completionHandler: @escaping(Result<[PlanetDataWrapper], NetworkError>) -> Void) {
        
        let placesEndPointURL = "https://swapi.co/api/planets/"
        
        guard let url = URL(string: placesEndPointURL) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        fetchPlanetsData(fromRequest: urlRequest, completionHandler: completionHandler)
  
    }
    
}

