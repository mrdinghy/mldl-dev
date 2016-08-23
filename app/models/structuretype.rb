class Structuretype < EnumerateIt::Base
  associate_values(
      cf:   [1, 'Community Forum'],
      dsc:  [2, 'District Council'],
      csc:  [3, 'County Council'],
      nsc:  [4, 'National Security Council']
  )
end




