Example params from a Study
=> #<ActionController::Parameters {"authenticity_token"=>"dA0lpCLx21JVcVvEmLPwBL5QspVuy9eme3LdXaAHZJVs0Cq9gEq1gsaGJZTo7nPSJB5bMYF4l4CZeC0j-2_dtQ", "study"=>{"title"=>"Rails", "semester"=>"1", "year"=>"2021", "number"=>"1", "subtitles_attributes"=>{"0"=>{"name"=>"Rails Forms", "points_attributes"=>{"0"=>{"name"=>"Form_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates a form form an object dynamically."}}}, "1"=>{"name"=>"Fields_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates fields for the attributes of a child of the form object."}}}}, "_destroy"=>"0"}, "1"=>{"name"=>"Rails Routes", "points_attributes"=>{"0"=>{"name"=>"Scopes", "notes_attributes"=>{"0"=>{"details"=>"Used in routes to replace a repeated word within a set of routes."}}}, "1"=>{"name"=>"Namespaced", "notes_attributes"=>{"0"=>{"details"=>"When the controller's folder includes an additional folder, that folder is considered a module and hence, routes that use controllers within the module folder must include 'module: <folder_name>'. If the route has a scope with the same name as the module, then the route can be written as 'namespace <folder_name>'."}}}}, "_destroy"=>"0"}}}, "commit"=>"Create Study", "controller"=>"studies", "action"=>"create"} permitted: false>
params = {"authenticity_token"=>"dA0lpCLx21JVcVvEmLPwBL5QspVuy9eme3LdXaAHZJVs0Cq9gEq1gsaGJZTo7nPSJB5bMYF4l4CZeC0j-2_dtQ", "study"=>{"title"=>"Rails", "semester"=>"1", "year"=>"2021", "number"=>"1", "subtitles_attributes"=>{"0"=>{"name"=>"Rails Forms", "points_attributes"=>{"0"=>{"name"=>"Form_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates a form form an object dynamically."}}}, "1"=>{"name"=>"Fields_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates fields for the attributes of a child of the form object."}}}}, "_destroy"=>"0"}, "1"=>{"name"=>"Rails Routes", "points_attributes"=>{"0"=>{"name"=>"Scopes", "notes_attributes"=>{"0"=>{"details"=>"Used in routes to replace a repeated word within a set of routes."}}}, "1"=>{"name"=>"Namespaced", "notes_attributes"=>{"0"=>{"details"=>"When the controller's folder includes an additional folder, that folder is considered a module and hence, routes that use controllers within the module folder must include 'module: <folder_name>'. If the route has a scope with the same name as the module, then the route can be written as 'namespace <folder_name>'."}}}}, "_destroy"=>"0"}}}, "commit"=>"Create Study", "controller"=>"studies", "action"=>"create"} 

params[:study] = {"title"=>"Rails", "semester"=>"1", "year"=>"2021", "number"=>"1", "subtitles_attributes"=>{"0"=>{"name"=>"Rails Forms", "points_attributes"=>{"0"=>{"name"=>"Form_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates a form form an object dynamically."}}}, "1"=>{"name"=>"Fields_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates fields for the attributes of a child of the form object."}}}}, "_destroy"=>"0"}, "1"=>{"name"=>"Rails Routes", "points_attributes"=>{"0"=>{"name"=>"Scopes", "notes_attributes"=>{"0"=>{"details"=>"Used in routes to replace a repeated word within a set of routes."}}}, "1"=>{"name"=>"Namespaced", "notes_attributes"=>{"0"=>{"details"=>"When the controller's folder includes an additional folder, that folder is considered a module and hence, routes that use controllers within the module folder must include 'module: <folder_name>'. If the route has a scope with the same name as the module, then the route can be written as 'namespace <folder_name>'."}}}}, "_destroy"=>"0"}}}

params[:study][:subtitles_attributes] = {"0"=>{"name"=>"Rails Forms", "points_attributes"=>{"0"=>{"name"=>"Form_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates a form form an object dynamically."}}}, "1"=>{"name"=>"Fields_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates fields for the attributes of a child of the form object."}}}}, "_destroy"=>"0"}, "1"=>{"name"=>"Rails Routes", "points_attributes"=>{"0"=>{"name"=>"Scopes", "notes_attributes"=>{"0"=>{"details"=>"Used in routes to replace a repeated word within a set of routes."}}}, "1"=>{"name"=>"Namespaced", "notes_attributes"=>{"0"=>{"details"=>"When the controller's folder includes an additional folder, that folder is considered a module and hence, routes that use controllers within the module folder must include 'module: <folder_name>'. If the route has a scope with the same name as the module, then the route can be written as 'namespace <folder_name>'."}}}}, "_destroy"=>"0"}}

params[:study][:subtitles_attributes].values = [  #This is an array of two hashes
# Hash 1 
{"name"=>"Rails Forms",     # Hash 1 is made up of two hashes; the key of the first hash is "name"; the key of the second hash is "points_attributes"
"points_attributes"=>
 {"0"=>{"name"=>"Form_for helper", "notes_attributes"=>{"0"=>{"details"=>"Creates a form from an object dynamically."}}},
  "1"=>
   {"name"=>"Fields_for helper",
    "notes_attributes"=>{"0"=>{"details"=>"Creates fields for the attributes of a child of the form object."}}}},
"_destroy"=>"0"},
#  Hash 2
{"name"=>"Rails Routes",    # Hash 2 is made up of two hashes; the key of the first hash is "name"; the key of the second hash is "points_attributes"
"points_attributes"=>
 {"0"=>
   {"name"=>"Scopes",
    "notes_attributes"=>{"0"=>{"details"=>"Used in routes to replace a repeated word within a set of routes."}}},
  "1"=>
   {"name"=>"Namespaced",
    "notes_attributes"=>
     {"0"=>
       {"details"=>
         "When the controller's folder includes an additional folder, that folder is considered a module and hence, routes that use controllers within the module folder must include 'module: <folder_name>'. If the route has a scope with the same name as the module, then the route can be written as 'namespace <folder_name>'."}}}},
"_destroy"=>"0"}]

def build_subtitles
  temporary_study.outline = {}
  # For the outline hash, set a key-value pair consisting of a 'subtitles' symbol key and an empty hash value
  temporary_study.outline[:subtitles] = {}
  m = temporary_study.subtitles.size
  # Construct one empty array for each subtitle key
  m.times { |i|
    temporary_study.outline[:subtitles][temporary_study.subtitles[i].name] = []
  }
  # For each subtitle key:
  m.times { |i|
    j = temporary_study.subtitles[i].points.size
    k = 0
    # For each point within each subtitle, construct a hash with a key of the point name and a value of that point's note details and push the hash to the subttitle's array
    while k < j
      subtitle = temporary_study.subtitles[i]
      point = subtitle.points[k]
      note = point.notes[0]
      temporary_study.outline[:subtitles][subtitle.name] << {point.name => note ? note.details : "" } if point
      k += 1
    end
  }
end

