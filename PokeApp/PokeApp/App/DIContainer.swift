//
//  DIContainer.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import Swinject

class DependencyInjectionContainer {
  public static var shared : Container = Container()
  
  public static func initialize(){
    
    // -MARK: - Data -
    
    DependencyInjectionContainer.shared.register(DataBaseDataSource.self) { _ in DataBaseDataSource()}
    DependencyInjectionContainer.shared.register(NetworkDataSource.self) { _ in NetworkDataSource()}
    
    DependencyInjectionContainer.shared.register(CoreDataStack.self) { _ in CoreDataStack.shared }
    
    DependencyInjectionContainer.shared
      .register(PokemonRepository.self) { resolver in
        PokemonRepositoryImpl(localDataSource:
                                resolver.resolve(DataBaseDataSource.self)!,
                              remoteDataSource:
                                resolver.resolve(NetworkDataSource.self)!)}
    
    
    // -MARK: - UseCases -
    
    DependencyInjectionContainer.shared.register(GetPokemonsUseCase.self) { resolver in
      GetPokemonsUseCase(repo: resolver.resolve(PokemonRepository.self)!)
    }
    DependencyInjectionContainer.shared.register(AddPokemonsUseCase.self) { resolver in
      AddPokemonsUseCase(repo: resolver.resolve(PokemonRepository.self)!)
    }
  }
}
