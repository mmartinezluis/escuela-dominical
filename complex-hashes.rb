a = [1,2,3,4]

b = ["a", "b", "c", "d"]

h = Hash.new
m = Hash.new
# Let each element of array a be a key for hash h, and let each element of array b
# be the corresonding value for the keys of h 

a.each do | ae|
  b.each do | be|
    h[a] = be
  end
end
# Return value  => {[1, 2, 3, 4]=>"d"} 

m[1] = "a"
# => {1=>"a"} 

############################################################
# FROM http://ruby-for-beginners.rubymonstas.org/built_in_classes/hashes.html#:~:text=In%20Ruby%20you%20can%20create,whole%20thing%20with%20curly%20braces.

{ 1 => "eins", 2 => "zwei", 3 => "drei" }
{ :one => "eins", :two => "zwei", :three => "drei" }
{ "weights" => ["pound", "kilogram"], "lengths" => ["meter", "mile"] }
{ :de => { :one => "eins", :two => "zwei", :three => "drei" } }


# The two below hashes are the same
{ :one => "eins", :two => "zwei", :three => "drei" }
{ one: "eins", two: "zwei", three: "drei" }
#######################################################

{ :subtitle =>

    subtitle_strings => [

      { point_string => note_string }

    ]

}




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

# Start iteration below to extract the subtitle
{ :subtitle =>
params[:study][:subtitles_attributes].values.collect do |subtitle_hash|
   subtitle_hash[:name]  => [     
  subtitle_hash[:points_attributes].values.collect do |point_hash|
    point_hash[:name] => 

    point_hash[:notes_attributes].values.collect do |notes_hash|
      notes_hash[:details]
    
    end
    
  end
    ]
end
}

outline={}
outline[:subtitles] = {
params[:study][:subtitles_attributes].values.collect do |subtitle_hash|
  "#{subtitle_hash[:name]}"[
  subtitle_hash[:points_attributes].values.collect do |point_hash|
    {
      "#{point_hash[:name]}" =>
        point_hash[:notes_attributes].values.collect do |notes_hash|
      "#{notes_hash[:details]}"
    end
    }
  end    
]
end
}
}


{ :subtitle => {

    subtitle_string => [

      { point_string => note_string }

    ]
  }
}

m= Hash.new
m[:subtitles] = {
  params[:study][:subtitles_attributes].values.each do |subtitle_hash|
    "#{subtitle_hash[:name]}" => [
      subtitle_hash[:points_attributes].values.each do |point_hash|
       { point_hash[:name] =>
        point_hash[:notes_attributes].values.collect do |notes_hash|
          notes_hash[:details]
        }
    ]
        end
      end
  end
}

m= Hash.new
m[:subtitles] = 

subtitles_from_params = []
  params[:study][:subtitles_attributes].values.each do |subtitle_hash|
    subtitles_from_params << subtitle_hash[:name]
  end

points_from_params = []
params[:study][:subtitles_attributes].values.collect do |subtitle_hash|   
  subtitle_hash[:points_attributes].values.collect do |point_hash|
    points_from_params << point_hash[:name] 
   end
end

notes_from_params =[]
params[:study][:subtitles_attributes].values.collect do |subtitle_hash|   
  subtitle_hash[:points_attributes].values.collect do |point_hash|
    point_hash[:notes_attributes].values.collect do |notes_hash|
        notes_from_params << notes_hash[:details]
    end
  end
end

outline={}
outline[:subtitles] = {
  subtitles_from_params.collect do |subtitle_hash|
  subtitle_hash => [
    poitnts_from_params.collect do |point_hash|
    {
      point_hash =>
        notes_from_params.collect do |notes_hash|
      notes_hash
    end
    }
  end    
]
end
}
}
###############################################################
points_from_params.uniq
outline[:subtitle] = {}
subs = subtitles_from_params
subs.length.times { |i|
    outline[:subtitle][ subtitles_from_params[i] ] = []
}

def loop_machine
    n = subtitles_from_params.length
    q = 0
    while q < n
        n.times { |i|
            outline[:subtitle][ subtitles_from_params[n-n] ] = [ points_from_params.uniq[i] ]
        }
        n.times { |i|
            outline[:subtitle][ subtitles_from_params[1] ] = [ points_from_params.uniq[i+n] ]
        }
    q += 1
    end

end

def build_outline
  temporary_study.outline[:subtitle] = {}
  m = temporary_study.subtitles.size
  m.times { |i|
    temporary_study.outline[:subtitle][temporary_study.subtitles[i].name] = []
  }

  m.times { |i|
    j = temporary_study.subtitles[i].points.size
    k = 0
    while k < j
      # subtitle_key = temporary_study.outline[:subtitle][temporary_study.subtitles[i].name]
      # point_key = temporary_study.subtitles[k].points.[k].name
      # note_value = point_key.notes[k].details

      temporary_study.outline[:subtitle][temporary_study.subtitles[i].name] << {temporary_study.subtitles[k].points[k].name => temporary_study.subtitles[k].points[k].notes[k].details}
      
      k += 1
    end

  }



end

###############################################################
h = Hash.new
h [:subtitle] = {
  "a" => [ 
      { "b"  => "c"} 
    ]
 }

m[:subtitle] = {
   params[:study][:subtitles_attributes].values.collect do |subtitle_hash|
    subtitle_hash[:name]  => [
         { "b"  => "c"} 
        
        ]
   end
 }
end

 params[:study][:subtitles_attributes].values.collect do |subtitle_hash|
    subtitle_hash[:name]
 end
    
{ :subtitle =>

    params[:study][:subtitles_attributes].values => [

      { point_string => note_string }

    ]

}