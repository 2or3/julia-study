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
    sum_of_squares=sum((prefs[persion1][item]-prefs[persion2][item])^2)
end
