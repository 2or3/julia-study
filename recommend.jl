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

function simdistance(prefs, persion1, persion2)
    si={}
    for x in prefs[persion1]
        if item in prefs[persion2]
            si[item]=1
        end
    end

    if length(si) == 0
        return 0
    end
    sum_of_squares = sum(map(x => if haskey(prefs[persion2], x) (prefs[persion1][x] - prefs[persion2][x])^2, prefs[persion1]))

    1 / (1 + sum_of_squares)
end

function simpersion(prefs, p1, p2)
  si = {}
  for item in prefs[p1]
    if !haskey(prefs[p1], item)
      si[item] = 1
    end
  end

  n = length(si)

  if n == 0 return 0

  sum1 = sum(map(it => pref[p1][it], si))
  sum2 = sum(map(it => pref[p2][it], si))

  sum1Sq = sum(map(it => pref[p1][it]^2, si))
  sum2Sq = sum(map(it => pref[p2][it]^2, si))

  pSum = sum(map(it => prefs[p1][it] * prefs[p2][it], si))

  num = pSum - (sum1 * sum2 / n)
  den = sqrt((sum1Sq - sum1^2 / n) * (sum2Sq - sum2^2 / n))
  if den == 0 return 0

  r = num / den
  return r
end

function topmatches(prefs, person, n=5, similarity=simpearson)
  for other in prefs
    if other != persion
      key = similarity(prefs, persion, other)
      scores[key] = other
    end
  end 
  
  sort(scores, rev=true)
  return scores[1:n]
end

function getecommendations(prefs, person, similarity=sim_pearson)
    totals = {}
    simSums = {}
    for other in prefs
        if other == persion
            continue
        end
        sim=similarity(prefs, person, other)

        if si <= 0
            continue
        end
        for item in prefs[ohter]
            if haskey(prefs[persion], item) || prefs[persion][item] == 0
                haskey(totals, item) ? totals[item] += prefs[other][item]*sim : totals[item] = 0
                haskey(simSums, item) ? simSums[item] += sim : totals[item] = 0
            end
        end
    end
    rankings = map((item, total) => total / sumSums[item], totals.items())
end

function transformPrefs(prefs)
  result = {}
  for person in prefs
    for item in prefs[person]
      if !haskey(result, item)
        result[item] = {}
      end

      result[item][person] = prefs[person][item]
    end
  end

  return result
end

function initializeUserDict(tag,count=5)
end

function fillitems(user_dict)
  all_items = {}
  for user in user_dict
    for i = 1:3
      try
        posts = get_userposts(user)
        break
      catch
        println "Failed user "+user+", retrying"
        sleep(4)
      end
    end
    for post in posts
      url = post["href"]
      user_dict[user][url] = 1.0
      all_items[url]=1
  end

  for ratings in user_dict.values()
    for item in all_items
      if !haskey(ratings, item)
        ratings[item]=0.0
      end
    end
  end
end

function transformprefs(prefs)
  result = {}
  for persion in prefs
    for item in prefs[persion]
      if !haskey(result, item)
        result[item] = {}
      end
    end
  end

  return result
end

function calculatesimilaritems(prefs, n=10)
  result = {}
  item_prefs = transformprefs(prefs)
  c = 0
  for item in item_prefs
    c+=1
    if c % 100 == 0
      printf("%d / %d", c, len(itemPrefs))
    end
    scores = topmatches(item_prefs, item, n, simdistance)
    result[item] = scores
  end
  return result
end

function loadmovielens(path="/data/movielens")
  movies = {}
  lines = open(path + "/u.item")
  for line in readlines(lines)
    (id, title) = line.split("|")[1:2]
    movies[id] = title
  end
  
  prefs = {}
  data = open(path + "/u.data")
  for line in data
    (user, movieid, rating, ts) = line.split('\t')
    if !haskey(prefs, user)
      prefs[user] = {}
    else
      prefs[user][movies[movieid]] = float(rating)
    end
  end
end
