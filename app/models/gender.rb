class Gender < EnumerateIt::Base
    associate_values(
        m:   [1, 'Male'],
        f:   [2, 'Female'],
        na:  [3, 'N/A']
    )
end
