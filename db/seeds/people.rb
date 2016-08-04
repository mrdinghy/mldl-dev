



orgtypes = Organizationtype.create ([
                {name: 'Youth Forum'},
                {name: 'Womens Forum'},
                {name: 'Motorcyclists Forum'},
                {name: 'Traditional Council'},
                {name: 'Muslim Council'},
                {name: 'Christian Council'},
                {name: 'Government'},
                {name: 'USG'},
                {name: 'NGO'},
                {name: 'Disabled Community'},
                {name: 'Other'}
])



orgs = Organization.create ([
                {name: 'Judiciary', organizationtype_id: 7},
                {name: 'DEA', organizationtype_id: 7},
                {name: 'BIN', organizationtype_id: 0},
                {name: 'Superintendent', organizationtype_id: 7},
                {name: 'Land Commissioner', organizationtype_id: 7},
                {name: 'Ministry of Gender', organizationtype_id: 7},
                {name: 'LMA', organizationtype_id: 7},
                {name: 'Special Asst to Superintendent', organizationtype_id: 7}
])











peeps = Person.create([

                      {name_first: 'Ringo', name_last: 'Starr', email: 'starr@ringo.com', title: 'Drummer', organization_id: 1 },
                      {name_first: 'John', name_last: 'Lennon', email: 'hereistand@beatles.com', title: 'Protestor', organization_id: 1 },
                      {name_first: 'Paul', name_last: 'McCartney', email: 'wingman@beatles.com', title: 'Bassist', organization_id: 2 },
                      {name_first: 'George', name_last: 'Harrison', email: 'sitar@psychedelic.org', title: 'Rhythym', organization_id: 4 },
                      {name_first: 'Pablo', name_last: 'Picasso', email: 'cubeguy@art.com', title: 'Graphic Designer', organization_id: 6 },
                      {name_first: 'Moby', name_last: 'Dick', email: 'callmefishmeal@melville.edu', title: 'Captain', organization_id: 4 },
                      {name_first: 'Lionel', name_last: 'Messi', email: 'messi1@barca.com', title: 'Attacking Midfielder', organization_id: 7 },
                      {name_first: 'Bob', name_last: 'Barker', email: 'bb@priceisright.com', title: 'Game Host', organization_id: 8 },
                      {name_first: 'Lady', name_last: 'Gaga', email: 'lgg@gagahq.com', title: 'Pop Star', organization_id: 3 },
                      {name_first: 'Rumple', name_last: 'Stilskin', email: 'sillmyname@story.com', title: 'No Title Yet', organization_id: 2 },
                      {name_first: 'Rip Van', name_last: 'Winkle', email: 'rwinkle@bowlworld.org', title: 'Slumberer', organization_id: 3 },
                      {name_first: 'Jacque', name_last: 'Cousteau', email: 'jcousteau@sea.org', title: 'Diver', organization_id: 1 }

                          ])