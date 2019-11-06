function getwordcounts(url)
  using LightXML

  d = root(parse_file(download(url)))
  wc = {}

  for e in get_elements_by_tagname(d, "item")
    if (e=find_element(i, "summary") != nothing)
      summary = content(e)
    else
      summary = content(find_element(i, "description"))
    end

    title = content(fine_element(i, "title"))
    words = getwords(title + " " + summary)
    for word in words
      if !haskey(wc, word)
        wc = {word => 0}
      end
      wc[word] += 1
    end
  end
end

function getwords(html)
  txt = replace(html, r"<[^>]+>", "")
  words = split(txt, r"[^A-Z^a-z]+", "")

  res = sum(map(word -> if word != "" lower(word) end,  words))
  return res
end

function readfile(filename)
    stream = open(filename)
    lines = {}
    for line in readlines(stream)
        push!(lines, line)
    end

    colnames = split(strip(line[1]), "\t")[2:]
    rownames = {}
    data = {}
    for line in lines[2:]
        p = split(strip(line), "\t")
        pop!(rownames, p[1])
        sum = sum(map(x -> float(x), p[2:]))
        pop!(data, sum)
    end
    return rownames, colnames, data
end

function kcluster(rows, distance = persion, k = 2)
    ranges = [(minimum([row[i] for row in rows]), maximum([row[i] for row in rows])) for i in [1:length(rows[1])]]

    clusters = [[rand() * (ranges[i][2] - ranges[i][1]) + ranges[i][1] for i in [1:length(rows[1])]] for j in [1:k]]

    lastmatches=None
    for t=1:100
        @printf("Iteration %d \n", t)
        bestmatches = [[] for i in [1:k]]

        for j=1:length(rows)
            row = rows[j]
            bestmatch = 0
            for i=1:k
                d = distance(clusters[i], row)
                if d < distance(clusters[bestmatch], row) bestmatch = i end
            end
            bestmatches[bestmatch] = [bestmatches[bestmatch], j]
        end

        if bestmatches == lastmatches break end
        lastmatches = bestmatches
    end

    for i=1:k
        avgs = [[0.0] for j in 1:length(rows[1])]
        if length(bestmatches[i]) > 0
            for rowid in bestmatches[i]
                for m in [1:rows[rowid]]
                    avgs[m] += rows[rowid][m]
                end
            end
            for j in [1:length(avgs)]
                avgs[j] /= length(bestmatches[i])
            end
            clusters[i] = avgs
        end
    end

    return bestmatches
end
