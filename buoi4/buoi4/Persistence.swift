//
//  Persistence.swift
//  buoi4
//
//  Created by TuanAnh on 2/12/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let samplePokeMon = Pokemon(context: viewContext)
        samplePokeMon.id = 1
        samplePokeMon.name = "bulbasaur"
        samplePokeMon.types = ["grass", "posion"]
        samplePokeMon.hp = 45
        samplePokeMon.attack = 49
        samplePokeMon.defense = 49
        samplePokeMon.specialAttack = 65
        samplePokeMon.specialDefense = 65
        samplePokeMon.speed = 45
        samplePokeMon.sprite = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        samplePokeMon.shiny = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png")
        samplePokeMon.favorite = false

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "buoi4")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
