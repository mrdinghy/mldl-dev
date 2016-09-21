class Status < EnumerateIt::Base
  associate_values new:1,ongoing: 2, resolved: 3, mediation: 4,cancelled: 5
end
