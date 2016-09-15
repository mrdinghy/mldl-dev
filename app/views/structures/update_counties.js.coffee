
3
4
# app/views/welcome/update_cities.js.coffee

$("#districts_select").empty()
.append("<%= escape_javascript(render(:partial => @districts)) %>")
