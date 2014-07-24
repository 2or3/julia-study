critics = {
  "Lisa Rose" => {
    "Lady in the Water" => 2.5,
    "Snakes on a Plane" => 3.5,
    "Just My Luck" => 3.0,
    "Superman Returns" => 3.5,
    "You, Me and Dupree" => 2.5,
    "The Night Listener" => 3.0
  },
  "Gene Seymour" => {
    "Lady in the Water" => 3.0,
    "Snakes on a Plane" => 3.5,
    "Just My Luck" => 1.5,
    "Superman Returns" => 5.0,
    "The Night Listener" => 3.0,
    "You, Me and Dupree" => 3.5
  },
  "Michael Phillips" => {
    "Lady in the Water" => 2.5,
    "Snakes on a Plane" => 3.0,
    "Superman Returns" => 3.5,
    "The Night Listener" => 4.0
  },
  "Claudia Puig" => {
    "Snakes on a Plane" => 3.5,
    "Just My Luck" => 3.0,
    "The Night Listener" => 4.5,
    "Superman Returns" => 4.0,
    "You, Me and Dupree" => 2.5
  },
  "Mick LaSalle" => {
    "Lady in the Water" => 3.0,
    "Snakes on a Plane" => 4.0,
    "Just My Luck" => 2.0,
    "Superman Returns" => 3.0,
    "The Night Listener" => 3.0,
    "You, Me and Dupree" => 2.0
  },
  "Jack Matthews" => {
    "Lady in the Water" => 3.0,
    "Snakes on a Plane" => 4.0,
    "The Night Listener" => 3.0,
    "Superman Returns" => 5.0,
    "You, Me and Dupree" => 3.5
  },
  "Toby" => {
    "Snakes on a Plane" =>4.5,
    "You, Me and Dupree" =>1.0,
    "Superman Returns" =>4.0
  }
}

function sim_distance(prefs, persion1, persion2)
    si={}
    for x in prefs[persion1]
        if item in prefs[persion2]
            si[item]=1
        end
    end

    if length(si) == 0
        return 0
    end
    sum_of_squares=sum((x1, x2) -> (x1-x2)^2, filter(x -> in(x, prefs[persion2]), prefs[persion1]))

    1 / (1 + sum_of_squares)
end

function get_euclidean_distance(x1, x2)
  sum((x1-x2)^2)
end
