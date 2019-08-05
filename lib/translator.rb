require "yaml"
require 'pry'

def load_library(file_name)
  newHash = {"get_emoticon" => {}, "get_meaning" => {}}
  file = YAML.load_file(file_name)
  file.each{|entry|
    newHash["get_emoticon"][entry[1][0]] = entry[1][1]
    newHash["get_meaning"][entry[1][1]] = entry[0]

  }
  return newHash
end

def get_japanese_emoticon(file_name, western_emoticon)
  dict = load_library(file_name)
  
  name = dict["get_emoticon"].find{|key, value| key == western_emoticon}
 
  if name
   return name[1]
  else
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file_name, japanese_emoticon)
  dict = load_library(file_name)
  
  name = dict["get_meaning"].find{|key, value| key == japanese_emoticon}
 
  if name
   return name[1]
  else
    return "Sorry, that emoticon was not found"
  end

end
