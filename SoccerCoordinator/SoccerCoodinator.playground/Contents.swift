// Soccer League Coordinator
// This program takes a group of players and divides them evenly based on height and experience across 3 teams


// Used this to get the random value generator
import Foundation

// Creating dictionary instances for player info
var playerJoeSmith: [String: String] = [
"name":  "Joe Smith",
"height": "42",
"hasExperience": "YES",
"guardians": "Jim and Jan Smith"
]

var playerJillTanner: [String: String] = [
"name":  "Jill Tanner",
"height": "36",
"hasExperience": "YES",
"guardians": "Clara Tanner"
]

var playerBillBon: [String: String] = [
"name":  "Bill Bon",
"height": "43",
"hasExperience": "YES",
"guardians": "Sara and Jenny Bon"
]

var playerEvaGordon: [String: String] = [
"name":  "Eva Gordon",
"height": "45",
"hasExperience": "NO",
"guardians": "Wendy and Mike Gordon"
]

var playerMattGill: [String: String] = [
"name":  "Matt Gill",
"height": "40",
"hasExperience": "NO",
"guardians": "Charles and Sylvia Gill"
]

var playerKimmyStein: [String: String] = [
"name":  "Kimmy Stein",
"height": "41",
"hasExperience": "NO",
"guardians": "Bill and Hillary Stein"
]

var playerSammyAdams: [String: String] = [
"name":  "Sammy Adams",
"height": "45",
"hasExperience": "NO",
"guardians": "Jeff Adams"
]

var playerKarlSaygan: [String: String] = [
"name":  "Karl Saygan",
"height": "42",
"hasExperience": "YES",
"guardians": "Heather Bledsoe"
]

var playerSuzaneGreenberg: [String: String] = [
"name":  "Suzane Greenberg",
"height": "44",
"hasExperience": "YES",
"guardians": "Henrietta Dumas"
]

var playerSalDali: [String: String] = [
"name":  "Sal Dali",
"height": "41",
"hasExperience": "NO",
"guardians": "Gala Dali"
]

var playerJoeKavalier: [String: String] = [
"name":  "Joe Kavalier",
"height": "39",
"hasExperience": "NO",
"guardians": "Sam and Elaine Kavalier"
]

var playerBenFinkelstein: [String: String] = [
"name":  "Ben Finkelstein",
"height": "44",
"hasExperience": "NO",
"guardians": "Aaron and Jill Finkelstein"
]

var playerDiegoSoto: [String: String] = [
"name":  "Diego Soto",
"height": "41",
"hasExperience": "YES",
"guardians": "Robin and Sarika Soto"
]

var playerChloeAlaska: [String: String] = [
"name":  "Chloe Alaska",
"height": "47",
"hasExperience": "NO",
"guardians": "David and Jamie Alaska"
]

var playerArnoldWillis: [String: String] = [
"name":  "Arnold Willis",
"height": "43",
"hasExperience": "NO",
"guardians": "Claire Willis"
]

var playerPhillipHelm: [String: String] = [
"name":  "Phillip Helm",
"height": "44",
"hasExperience": "YES",
"guardians": "Thomas Helm and Eva Jones"
]

var playerLesClay: [String: String] = [
"name":  "Les Clay",
"height": "42",
"hasExperience": "YES",
"guardians": "Wynonna Brown"
]

var playerHerschelKrustofski: [String: String] = [
"name":  "Herschel Krustofski",
"height": "45",
"hasExperience": "YES",
"guardians": "Hyman and Rachel Krustofski"
]

// Creating the array to hold the list of players
var soccerPlayers: [[String: String]] = [
    playerJoeSmith,
    playerJillTanner,
    playerBillBon,
    playerEvaGordon,
    playerMattGill,
    playerKimmyStein,
    playerSammyAdams,
    playerKarlSaygan,
    playerSuzaneGreenberg,
    playerSalDali,
    playerJoeKavalier,
    playerBenFinkelstein,
    playerDiegoSoto,
    playerChloeAlaska,
    playerArnoldWillis,
    playerPhillipHelm,
    playerLesClay,
    playerHerschelKrustofski

]

// Divide experience and inexperienced players for sorting
var rookieSoccerPlayers: [[String: String]] = [ ]
var experiencedSoccerPlayers: [[String: String]] = [ ]
let yes = "YES"
let no = "NO"

for player in soccerPlayers {
    if player["hasExperience"]  == yes {
        experiencedSoccerPlayers.append(player)
    } else if player["hasExperience"] == no {
        rookieSoccerPlayers.append(player)
    }
}

// Define a function to sorty players by height in ascending order
// Using two loops, each player can be compared to the rest of the players on the team
// (e.g.,) player1 to player2, player1 to player3, player1 to player4, etc.
func sortPlayersByHeight(roster: [[String: String]]) -> ([[String: String]]) {
    var roster = roster
    var outerCounter = 0
    while outerCounter < roster.count - 1 {
        var innerCounter = outerCounter + 1
        while innerCounter < roster.count {
            var player1 = roster[outerCounter]
            var player2 = roster[innerCounter]
            if player1["height"]! < player2["height"]! {
                let shorterPlayerIndex = outerCounter
                let tallerPlayerIndex = innerCounter
                let tempPlayer1 = roster[shorterPlayerIndex]
                let tempPlayer2 = roster[tallerPlayerIndex]
                roster[shorterPlayerIndex] = tempPlayer2
                roster[tallerPlayerIndex] = tempPlayer1
                }
            innerCounter += 1
        }
        outerCounter += 1
    }
    return roster;
}

// Sort users by height and experience for assignment
var sortedRookieSoccerPlayers = sortPlayersByHeight(roster: rookieSoccerPlayers)
var sortedExperiencedSoccerPlayers = sortPlayersByHeight(roster: experiencedSoccerPlayers)
var sortedAllSoccerPlayers: [[String: String]] = sortedExperiencedSoccerPlayers + sortedRookieSoccerPlayers

// Define a function to get the average height for a team
func getAverageHeight(roster: [[String: String]]) -> Double {
    var sum: Double = 0.0
    var counter: Double = 0.0
    for player in roster {
        let height = player["height"]
        let heightToDouble = Double(height!)
        sum += heightToDouble!
        counter += 1.0
    }
    let averageHeight = sum / counter
    return averageHeight
}

// Define a function to check the average height difference between two teams
func checkHeightDifference(team1: Double, team2: Double) -> Double {
    var heightDifference: Double
    if team1 > team2 {
        heightDifference = team1 - team2
    } else {
        heightDifference = team2 - team1
    }
    return heightDifference
}

// Declare dictionaries for teams
// Declare a boolean value to use if players should be reassigned if the average height difference is greater than 1.5
var dragonsTeam: [[String: String]] = [ ]
var sharksTeam: [[String: String]] = [ ]
var raptorsTeam: [[String: String]] = [ ]
var isAverageHeightFair: Bool = true

// Continue assigning players across teams until a set of teams produced has an average height differnce no greater than 1.5
repeat {
    // Used a random variable to change who gets first pick
    var firstPick = Int(arc4random_uniform(UInt32(3)))
    var teamCounter = firstPick
    // Since the players are sorted by height, logic here is to get first and last pick in a rotation to try and keep the average heights even
    for player in sortedAllSoccerPlayers {
        var player = player
        switch teamCounter {
        case 0: (
            player["Team"] = "Dragons",
            player["practice"] = "March 17, 1pm",
            dragonsTeam.append(player),
            teamCounter += 1
            )
        case 1, 4: (
            player["Team"] = "Sharks",
            player["practice"] = "March 17, 3pm",
            sharksTeam.append(player),
            teamCounter += 1
            )
        case 2, 3: (
            player["Team"] = "Raptors",
            player["practice"] = "March 18, 1pm",
            raptorsTeam.append(player),
            teamCounter += 1
            )
        case 5: (
            player["Team"] = "Dragons",
            player["practice"] = "March 17, 1pm",
            dragonsTeam.append(player),
            teamCounter = 0
            )
            
        default: break
        }
    }
    // Check for average height differences
    let averageHeightDragons = getAverageHeight(roster: dragonsTeam)
    let averageHeightSharks = getAverageHeight(roster: sharksTeam)
    let averageHeightRaptors = getAverageHeight(roster: raptorsTeam)
    
    // Used a loop and an array for a comparison checked. It would be easy to add teams here if in the future it is needed.
    let averageHeights: [Double] = [ averageHeightDragons, averageHeightSharks, averageHeightRaptors ]
    let averageHeightMaxDifference = 1.5
    
    var averageHeightCounter1 = 0
    while averageHeightCounter1 < averageHeights.count - 1{
        var averageHeightCounter2 = averageHeightCounter1 + 1
        while averageHeightCounter2 < averageHeights.count {
            let heightDiff = checkHeightDifference(team1: averageHeights[averageHeightCounter1], team2: averageHeights[averageHeightCounter2])
            if heightDiff > averageHeightMaxDifference {
                isAverageHeightFair = false
            } else {
                isAverageHeightFair = true
            }
            averageHeightCounter2 += 1
        }
        averageHeightCounter1 += 1
    }
} while isAverageHeightFair == false

// Define a function to email guardians player info for a team
func emailTeamGuardians(roster: [[String: String]]) {
    for player in roster {
        let guardians = player["guardians"]!
        let team = player["Team"]!
        let practice = player["practice"]!
        let playerName = player["name"]!
        print("Dear \(guardians),\n\nYour child, \(playerName), has been placed on the \(team) team. The first scheduled practice will be on \(practice). Please give us a call at (123) 456-7890 if you have any questions.\n\n\nRegards,\nTeam Coordinator")
    }
}

// Loop through the teams to send out notifications
var teams = [dragonsTeam, sharksTeam, raptorsTeam]
for team in teams {
    emailTeamGuardians(roster: team)
}

