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
