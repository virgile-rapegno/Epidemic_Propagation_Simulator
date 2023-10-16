/* Affichage */
import CoreGraphics
import PlaygroundSupport
import UIKit

let simulation = Environnement()

// Visualiser un voisinage
/*
 for agent in simulation.population.agents {
 agent.couleur = black
 }
 let agent = simulation.population.agents.randomElement()!
 let voisins = simulation.population.voisinage(en: agent.position_grille, simulation.population.grille)
 for voisin in voisins {
 voisin.couleur = purple
 }
 agent.couleur = green
 */

let contr'f4leur = UIView(frame: CGRect(x: 0, y: 0, width: 2 * taille_affichage, height: taille_affichage + 100))

let graphique = UIImageView(frame: CGRect(x: 0, y: 50, width: taille_affichage, height: taille_affichage))
graphique.image = simulation.afficher()
contr'f4leur.addSubview(graphique)

class ActionTarget {
    let closure: () -> Void
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    @objc func action() {
        closure()
    }
}


// affichage des diff'e9rents compteurs
let compteurs = UILabel(frame: CGRect(x: taille_affichage, y: 0, width: taille_affichage / 4, height: 100))
compteurs.text = "tour : (simulation.nombre_tour) n population : (nombre_individus) n malades : (simulation.population.malades.count) n servilit'e9 : (Double(simulation.population.serviles.count) / Double(nombre_individus))"
compteurs.backgroundColor = .white
compteurs.textColor = .black
compteurs.numberOfLines = 4
contr'f4leur.addSubview(compteurs)

// Bouton 1
let bouton_avancer1 = UIButton(frame: CGRect(x: 0, y: 0, width: taille_affichage / 4, height: 50))
bouton_avancer1.setTitle("1 'e9tapes", for: .normal)
bouton_avancer1.setTitleColor(.black, for: .normal)
bouton_avancer1.backgroundColor = .white
let action_avancer1 = ActionTarget {
    simulation.'e9tape()
    print(simulation.nombre_tour)
    graphique.image = simulation.afficher()
    compteurs.text = "tour : (simulation.nombre_tour) n population : (nombre_individus) n malades : (simulation.population.malades.count) n servilit'e9 : (Double(simulation.population.serviles.count) / Double(nombre_individus))"
}

bouton_avancer1.addTarget(action_avancer1, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_avancer1)

// Bouton 10
let bouton_avancer10 = UIButton(frame: CGRect(x: taille_affichage / 4, y: 0, width: taille_affichage / 4, height: 50))
bouton_avancer10.setTitle("10 'e9tapes", for: .normal)
bouton_avancer10.setTitleColor(.black, for: .normal)
bouton_avancer10.backgroundColor = .white
let action_avancer10 = ActionTarget {
    for _ in 0 ..< 10 {
        simulation.'e9tape()
        print(simulation.nombre_tour)
    }
    graphique.image = simulation.afficher()
    compteurs.text = "tour : (simulation.nombre_tour) n population : (nombre_individus) n malades : (simulation.population.malades.count) n servilit'e9 : (Double(simulation.population.serviles.count) / Double(nombre_individus))"
}

bouton_avancer10.addTarget(action_avancer10, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_avancer10)

// Bouton 100
let bouton_avancer100 = UIButton(frame: CGRect(x: 2 * taille_affichage / 4, y: 0, width: taille_affichage / 4, height: 50))
bouton_avancer100.setTitle("100 'e9tapes", for: .normal)
bouton_avancer100.setTitleColor(.black, for: .normal)
bouton_avancer100.backgroundColor = .white
let action_avancer100 = ActionTarget {
    for _ in 0 ..< 100 {
        simulation.'e9tape()
        print(simulation.nombre_tour)
    }
    graphique.image = simulation.afficher()
    compteurs.text = "tour : (simulation.nombre_tour) n population : (nombre_individus) n malades : (simulation.population.malades.count) n servilit'e9 : (Double(simulation.population.serviles.count) / Double(nombre_individus))"
}

bouton_avancer100.addTarget(action_avancer100, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_avancer100)

// Bouton 1000
let bouton_avancer1000 = UIButton(frame: CGRect(x: 3 * taille_affichage / 4, y: 0, width: taille_affichage / 4, height: 50))
bouton_avancer1000.setTitle("1000 'e9tapes", for: .normal)
bouton_avancer1000.setTitleColor(.black, for: .normal)
bouton_avancer1000.backgroundColor = .white
let action_avancer1000 = ActionTarget {
    for _ in 0 ..< 1000 {
        simulation.'e9tape()
        print(simulation.nombre_tour)
    }
    graphique.image = simulation.afficher()
    compteurs.text = "tour : (simulation.nombre_tour) n population : (nombre_individus) n malades : (simulation.population.malades.count) n servilit'e9 : (Double(simulation.population.serviles.count) / Double(nombre_individus))"
}

bouton_avancer1000.addTarget(action_avancer1000, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_avancer1000)

// bouton changement 'e9tat confinement
let bouton_confinement = UIButton(frame: CGRect(x: taille_affichage, y: 100, width: taille_affichage / 4, height: 50))
bouton_confinement.setTitle("confinement", for: .normal)
bouton_confinement.setTitleColor(.black, for: .normal)
bouton_confinement.backgroundColor = .green
let action_confinement = ActionTarget {
    simulation.confinement()
    graphique.image = simulation.afficher()
    if simulation.en_confinement {
        bouton_confinement.backgroundColor = .red
    } else {
        bouton_confinement.backgroundColor = .green
    }
}

bouton_confinement.addTarget(action_confinement, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_confinement)

// bouton changement 'e9tat distanciation
let bouton_distanciation = UIButton(frame: CGRect(x: taille_affichage, y: 150, width: taille_affichage / 4, height: 50))
bouton_distanciation.setTitle("distanciation", for: .normal)
bouton_distanciation.setTitleColor(.black, for: .normal)
bouton_distanciation.backgroundColor = .green
let action_distanciation = ActionTarget {
    if simulation.en_distanciation {
        simulation.en_distanciation = false
        bouton_distanciation.backgroundColor = .green
    } else {
        simulation.en_distanciation = true
        bouton_distanciation.backgroundColor = .red
    }
}

bouton_distanciation.addTarget(action_distanciation, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_distanciation)

// bouton changement 'e9tat rassemblement
let bouton_rassemblement = UIButton(frame: CGRect(x: taille_affichage, y: 200, width: taille_affichage / 4, height: 50))
bouton_rassemblement.setTitle("rassemblement", for: .normal)
bouton_rassemblement.setTitleColor(.black, for: .normal)
bouton_rassemblement.backgroundColor = .green
let action_rassemblement = ActionTarget {
    if simulation.en_rassemblement {
        simulation.rassemblement()
        bouton_rassemblement.backgroundColor = .green
    } else {
        simulation.rassemblement()
        bouton_rassemblement.backgroundColor = .red
    }
}

bouton_rassemblement.addTarget(action_rassemblement, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_rassemblement)

// bouton visibilit'e9 des distances de propagations
let bouton_visible = UIButton(frame: CGRect(x: taille_affichage, y: 250, width: taille_affichage / 4, height: 50))
bouton_visible.setTitle("visible", for: .normal)
bouton_visible.setTitleColor(.black, for: .normal)
bouton_visible.backgroundColor = .green
let action_visible = ActionTarget {
    if simulation.distance_visible {
        simulation.distance_visible = false
        graphique.image = simulation.afficher()
        bouton_visible.backgroundColor = .green
    } else {
        simulation.distance_visible = true
        graphique.image = simulation.afficher()
        bouton_visible.backgroundColor = .red
    }
}

bouton_visible.addTarget(action_visible, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_visible)

// bouton d'exportation des sous populations
let bouton_exporter = UIButton(frame: CGRect(x: 0, y: taille_affichage + 50, width: taille_affichage, height: 50))
bouton_exporter.setTitle("exporter les donn'e9es", for: .normal)

bouton_exporter.setTitleColor(.black, for: .normal)
bouton_exporter.backgroundColor = .white
let action_exporter = ActionTarget {
    exportation_json(nom: "sains", donn'e9es: simulation.'e9volution_sains)
    exportation_json(nom: "malades", donn'e9es: simulation.'e9volution_malades)
    exportation_json(nom: "imunis'e9", donn'e9es: simulation.'e9volution_immunis'e9s)
}

bouton_exporter.addTarget(action_exporter, action: #selector(ActionTarget.action), for: .touchUpInside)
contr'f4leur.addSubview(bouton_exporter)

// Modifier en live le playground
PlaygroundPage.current.liveView = contr'f4leur
PlaygroundPage.current.needsIndefiniteExecution = true

/* Global */

// Exportation JSON
public func exportation_json(nom: String, donn'e9es: [Int]) {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    let pathDirectory = getDocumentsDirectory()
    print(pathDirectory)
    try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
    let filePath = pathDirectory.appendingPathComponent("(nom).json")
    
    let json = try? JSONEncoder().encode(donn'e9es)
    
    do {
        try json!.write(to: filePath)
    } catch {
        print("'e9chec d''e9xportation (nom)")
    }
}

/* Variables globales */

// Environnement
public let dur'e9e_'e9tape: CGFloat = 1.0
public let taille_environnement: CGFloat = 1.0
public let taille_affichage = Int(1000.0 * taille_environnement)
public let nombre_individus = Int(taille_environnement * taille_environnement * 250.0)
public let distance_d'e9placement: CGFloat = 0.001 * dur'e9e_'e9tape
public let nombre_malades_initial = 10
public let niveau_servilit'e9: CGFloat = 1.0

// Probabilit'e9s
public let probabilit'e9_malade: CGFloat = 0.0001
public let probabilit'e9_immunis'e9: CGFloat = 0.0001
public let probabilit'e9_isolement: CGFloat = 0.01
public let probabilit'e9_rassemblement: CGFloat = 0.1

// Individus
public let vitesse_'e9loignement: CGFloat = 0.01
public let distance_s'e9curit'e9: CGFloat = 0.05
public let distance_contamination: CGFloat = 0.05
public let distance_contamination_confinement: CGFloat = distance_contamination * 0.1
public let distance_d'e9placement_confinement: CGFloat = distance_d'e9placement * 0.5

/* Structures, Variables et Fonctions utiles */

// Diff'e9rent Statut des individus
public enum Statut {
    case sain, malade, immunis'e9, isol'e9
}

// Couleur pour affichage
public let white = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
public let black = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
public let shadow = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
public let red = CGColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
public let green = CGColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
public let blue = CGColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
public let purple = CGColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)

// Distance avec la norme euclidienne usuelle de R
public func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
    let x = CGFloat(a.x - b.x)
    let y = CGFloat(a.y - b.y)
    return (sqrt(x * x + y * y))
}

// Nombre r'e9elle al'e9atoire entre 0 et 1
public func random() -> CGFloat {
    CGFloat.random(in: 0 ... 1)
}

// V'e9rifie et replace les agents dans l'environnement
public func dans_environnement(_ x: CGFloat) -> CGFloat {
    switch x {
    case x  where x < 0:
        return 0.1 + (vitesse_'e9loignement * random()) 
    case x  where x > taille_environnement:
        return taille_environnement - 0.1 + (vitesse_'e9loignement * random())
    default:
        return x 
    }
}

/* Individu */

public class Individu: Hashable {
    public let id: Int
    public var coordonn'e9es: CGPoint
    public var couleur: CGColor
    public var statut: Statut
    public var isol'e9: Bool
    public var servile: Bool
    public var vitesse: CGFloat
    public var propagation: CGFloat
    public var position_grille: (Int,Int) {
        get {
            (Int(coordonn'e9es.x * 10), Int(coordonn'e9es.y * 10))
        }
    }
    
    public static func == (lhs: Individu, rhs: Individu) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into _: inout Hasher) {
        id
    }
    
    public init(_ i: Int) {
        id = i
        coordonn'e9es = CGPoint(x: taille_environnement * random(), y: taille_environnement * random())
        couleur = black
        statut = .sain
        isol'e9 = false
        servile = (random() < niveau_servilit'e9)
        vitesse = distance_d'e9placement
        propagation = distance_contamination
    }
    
    public func devenir_malade() {
        statut = .malade
        couleur = red
    }
    
    public func devenir_immunis'e9() {
        statut = .immunis'e9
        couleur = green
    }
    
    public func devenir_isol'e9() {
        vitesse = distance_d'e9placement_confinement
        propagation = distance_contamination_confinement
        isol'e9 = true
        couleur = blue
    }
    
    public func d'e9placer() {
        let nouveau_x = dans_environnement(CGFloat(CGFloat(coordonn'e9es.x) + CGFloat.random(in: -1 ... 1) * vitesse))
        let nouveau_y = dans_environnement(CGFloat(CGFloat(coordonn'e9es.y) + CGFloat.random(in: -1 ... 1) * vitesse))
        coordonn'e9es = CGPoint(x: nouveau_x, y: nouveau_y)
    }
}

/* Population */

public class Population {
    public var agents: Set<Individu>
    public var sains: Set<Individu>
    public var malades: Set<Individu>
    public var immunis'e9s: Set<Individu>
    public var serviles: Set<Individu>
    public var grille: [[Set<Individu>]]
    public var ensemble_voisins: [[Set<Individu>]]
    public var d'e9plac'e9s: [Individu: CGPoint]
    
    public init(_ n: Int) {
        agents = Set<Individu>()
        for i in 0 ..< n {
            agents.insert(Individu(i))
        }
        sains = agents
        malades = Set<Individu>()
        immunis'e9s = Set<Individu>()
        serviles = Set<Individu>()
        for agent in agents {
            if agent.servile {
                serviles.insert(agent)
            }
        }
        grille = [[Set<Individu>]]()
        ensemble_voisins = [[Set<Individu>]]()
        d'e9plac'e9s = [Individu: CGPoint]()
        cr'e9er_grille()
        cr'e9er_ensemble_voisins()
    }
    
    //
    public func cr'e9er_grille() {
        grille = [[Set<Individu>]]()
        let sub_division = Int(taille_environnement * 10)
        for _ in 0 ... sub_division {
            var ligne = [Set<Individu>]()
            for _ in 0 ... sub_division {
                ligne.append(Set<Individu>())
            }
            grille.append(ligne)
        }
        for agent in agents {
            let (i, j) = agent.position_grille
            grille[i][j].insert(agent)
        }
    }
    
    // Donne l'ensemble des proches voisins d'un agent
    public func voisinage(en position: (Int, Int), _ grille: [[Set<Individu>]]) -> Set<Individu> {
        let (ligne, colonne) = position
        var voisins = grille[ligne][colonne]
        let max = Int(taille_environnement * 10)
        switch (ligne, colonne) {
        case let (i, j) where i == 0 && j == 0:
            voisins = voisins.union(grille[0][1])
            voisins = voisins.union(grille[1][1])
            voisins = voisins.union(grille[1][0])
        case let (i, j) where i == 0 && j == max:
            voisins = voisins.union(grille[0][max - 1])
            voisins = voisins.union(grille[1][max - 1])
            voisins = voisins.union(grille[1][max])
        case let (i, j) where i == max && j == 0:
            voisins = voisins.union(grille[max][1])
            voisins = voisins.union(grille[max - 1][1])
            voisins = voisins.union(grille[max - 1][0])
        case let (i, j) where i == max && j == max:
            voisins = voisins.union(grille[max][max - 1])
            voisins = voisins.union(grille[max - 1][max - 1])
            voisins = voisins.union(grille[max - 1][max])
        case let (i, j) where i == 0:
            voisins = voisins.union(grille[0][j - 1])
            voisins = voisins.union(grille[1][j - 1])
            voisins = voisins.union(grille[1][j])
            voisins = voisins.union(grille[1][j + 1])
            voisins = voisins.union(grille[0][j + 1])
        case let (i, j) where i == max:
            voisins = voisins.union(grille[max][j - 1])
            voisins = voisins.union(grille[max - 1][j - 1])
            voisins = voisins.union(grille[max - 1][j])
            voisins = voisins.union(grille[max - 1][j + 1])
            voisins = voisins.union(grille[max][j + 1])
        case let (i, j) where j == 0:
            voisins = voisins.union(grille[i - 1][0])
            voisins = voisins.union(grille[i - 1][1])
            voisins = voisins.union(grille[i][1])
            voisins = voisins.union(grille[i + 1][1])
            voisins = voisins.union(grille[i + 1][0])
        case let (i, j) where j == max:
            voisins = voisins.union(grille[i - 1][max])
            voisins = voisins.union(grille[i - 1][max - 1])
            voisins = voisins.union(grille[i][max - 1])
            voisins = voisins.union(grille[i + 1][max - 1])
            voisins = voisins.union(grille[i + 1][max])
        case let (i, j):
            voisins = voisins.union(grille[i - 1][j - 1])
            voisins = voisins.union(grille[i - 1][j])
            voisins = voisins.union(grille[i - 1][j + 1])
            voisins = voisins.union(grille[i][j - 1])
            voisins = voisins.union(grille[i][j + 1])
            voisins = voisins.union(grille[i + 1][j - 1])
            voisins = voisins.union(grille[i + 1][j])
            voisins = voisins.union(grille[i + 1][j + 1])
        }
        return voisins
    }
    
    // Cr'e9er l'ensemble contenant les voisins relatifs 'e0 une position sur la grille
    public func cr'e9er_ensemble_voisins() {
        ensemble_voisins = [[Set<Individu>]]()
        let max = Int(taille_environnement * 10)
        for i in 0 ... max {
            var ligne = [Set<Individu>]()
            for j in 0 ... max {
                ligne.append(voisinage(en: (i, j), grille))
            }
            ensemble_voisins.append(ligne)
        }
    }
    
    // S'e9paration des agents suivant un mod'e8le de r'e9pulsion 'e9lectrique
    public func se_s'e9parer(_ agent: Individu) {
        var vect_x: CGFloat = 0
        var vect_y: CGFloat = 0
        let (i, j) = agent.position_grille
        var voisins = ensemble_voisins[i][j]
        voisins.remove(agent)
        for voisin in voisins {
            if distance(agent.coordonn'e9es, voisin.coordonn'e9es) < distance_s'e9curit'e9 {
                let x = voisin.coordonn'e9es.x - agent.coordonn'e9es.x
                let y = voisin.coordonn'e9es.y - agent.coordonn'e9es.y
                var norme_cube = pow((x * x) + (y * y), 1.5)
                if norme_cube == 0 { continue }
                vect_x = vect_x + (x / (pow(10, 6.5) * norme_cube))
                vect_y = vect_y + (y / (pow(10, 6.5) * norme_cube))
            }
            vect_x = vect_x + (1 / (pow(10, 7.5) * agent.coordonn'e9es.x))
            vect_y = vect_y + (1 / (pow(10, 7.5) * agent.coordonn'e9es.y))
            vect_x = vect_x + (1 / (pow(10, 7.5) * (agent.coordonn'e9es.x - taille_environnement)))
            vect_y = vect_y + (1 / (pow(10, 7.5) * (agent.coordonn'e9es.x - taille_environnement)))
            let x = agent.coordonn'e9es.x + vect_x
            let y = agent.coordonn'e9es.y + vect_y
            agent.coordonn'e9es = CGPoint(x: dans_environnement(x), y: dans_environnement(y))
        }
    }
    
    // Envoyer un agent au centre
    public func aller_rassemblement() {
        let agent = agents.randomElement()!
        d'e9plac'e9s.updateValue(CGPoint(x: CGFloat(agent.coordonn'e9es.x), y: CGFloat(agent.coordonn'e9es.y)), forKey: agent)
        let x = CGFloat((taille_environnement / 2) + CGFloat.random(in: -1 ... 1) * vitesse_'e9loignement)
        let y = CGFloat((taille_environnement / 2) + CGFloat.random(in: -1 ... 1) * vitesse_'e9loignement)
        agent.coordonn'e9es = CGPoint(x: x, y: y)
    }
    
    // Retourner un agent 'e0 ses coordonn'e9es d'origine
    public func retour_rassemblement() {
        if !d'e9plac'e9s.isEmpty {
            let (agent, coordonn'e9es) = d'e9plac'e9s.randomElement()!
            agent.coordonn'e9es = coordonn'e9es
            d'e9plac'e9s.removeValue(forKey: agent)
        }
    }
    
    // R'e9alisation d'une 'e9tape pour la population
    public func 'e9volution(confinement: Bool, distanciation: Bool, rassemblement: Bool) {
        cr'e9er_grille()
        cr'e9er_ensemble_voisins()
        if distanciation {
            for agent in serviles {
                se_s'e9parer(agent)
            }
        } else {
            for agent in agents {
                agent.d'e9placer()
            }
        }
        cr'e9er_grille()
        cr'e9er_ensemble_voisins()
        if rassemblement {
            if random() < probabilit'e9_rassemblement {
                for _ in 0 ..< 20 {
                    aller_rassemblement()
                }
            }
            if random() / 10 < probabilit'e9_rassemblement {
                for _ in 0 ..< 20 {
                    retour_rassemblement()
                }
            }
        }
        cr'e9er_grille()
        cr'e9er_ensemble_voisins()
        for agent in sains {
            let (i, j) = agent.position_grille
            for voisin in ensemble_voisins[i][j] {
                let distance_entre = distance(agent.coordonn'e9es, voisin.coordonn'e9es)
                if distance_entre < voisin.propagation, exp(-distance_entre) * random() < probabilit'e9_malade {
                    agent.devenir_malade()
                    malades.insert(agent)
                    sains.remove(agent)
                }
            }
        }
        for agent in malades {
            if random() < probabilit'e9_immunis'e9 {
                agent.devenir_immunis'e9()
                immunis'e9s.insert(agent)
                malades.remove(agent)
                agent.isol'e9 = false
                if !confinement {
                    agent.vitesse = distance_d'e9placement
                    agent.propagation = distance_contamination
                }
            } else if agent.servile, !agent.isol'e9, random() < probabilit'e9_isolement {
                agent.devenir_isol'e9()
            }
        }
    }
}

/* Environnement */

public class Environnement {
    public var population: Population
    public var 'e9volution_sains: [Int]
    public var 'e9volution_malades: [Int]
    public var 'e9volution_immunis'e9s: [Int]
    public var en_confinement: Bool
    public var en_distanciation: Bool
    public var en_rassemblement: Bool
    public var nombre_tour: Int
    public var distance_visible: Bool
    
    public init() {
        population = Population(nombre_individus)
        for _ in 0 ..< nombre_malades_initial {
            let agent = population.agents.randomElement()!
            agent.devenir_malade()
            population.sains.remove(agent)
            population.malades.insert(agent)
        }
        'e9volution_sains = [nombre_individus - nombre_malades_initial]
        'e9volution_malades = [nombre_malades_initial]
        'e9volution_immunis'e9s = [0]
        en_confinement = false
        en_distanciation = false
        en_rassemblement = false
        nombre_tour = 0
        distance_visible = false
    }
    
    public func 'e9tape() {
        nombre_tour = nombre_tour + 1
        population.'e9volution(confinement: en_confinement, distanciation: en_distanciation, rassemblement: en_rassemblement)
        'e9volution_sains.append(population.sains.count)
        'e9volution_malades.append(population.malades.count)
        'e9volution_immunis'e9s.append(population.immunis'e9s.count)
    }
    
    public func confinement() {
        if !en_confinement {
            en_confinement = true
            for agent in population.serviles {
                if !agent.isol'e9 {
                    agent.vitesse = distance_d'e9placement_confinement
                    agent.propagation = distance_contamination_confinement
                }
            }
        } else {
            en_confinement = false
            for agent in population.serviles {
                if !agent.isol'e9 {
                    agent.vitesse = distance_d'e9placement
                    agent.propagation = distance_contamination
                }
            }
        }
    }
    
    public func rassemblement() {
        if !en_rassemblement {
            en_rassemblement = true
        } else {
            en_rassemblement = false
            for _ in 0 ..< population.d'e9plac'e9s.count {
                let (agent, coordonn'e9es) = population.d'e9plac'e9s.randomElement()!
                agent.coordonn'e9es = coordonn'e9es
                population.d'e9plac'e9s.removeValue(forKey: agent)
            }
        }
    }
    
    
    public func afficher() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: taille_affichage, height: taille_affichage))
        let img = renderer.image { ctx in
            ctx.cgContext.clear(CGRect(x: 0, y: 0, width: taille_affichage, height: taille_affichage))
            ctx.cgContext.setFillColor(white)
            ctx.cgContext.fill(CGRect(x: 0, y: 0, width: taille_affichage, height: taille_affichage))
            for agent in self.population.agents {
                
                // Visualiser la distance de contamination
                if self.distance_visible {
                    ctx.cgContext.setFillColor(shadow)
                    ctx.cgContext.fillEllipse(in: CGRect(x: CGFloat(taille_affichage) * agent.coordonn'e9es.x - (agent.propagation * CGFloat(taille_affichage) / 2) + 2.5, y: CGFloat(taille_affichage) * agent.coordonn'e9es.y - (agent.propagation * CGFloat(taille_affichage) / 2) + 2.5, width: agent.propagation * CGFloat(taille_affichage), height: agent.propagation * CGFloat(taille_affichage)))
                }
                
                ctx.cgContext.setFillColor(agent.couleur)
                ctx.cgContext.fillEllipse(in: CGRect(x: CGFloat(taille_affichage) * agent.coordonn'e9es.x, y: CGFloat(taille_affichage) * agent.coordonn'e9es.y, width: 5, height: 5))
            }
        }
        return img
    }
}

}
