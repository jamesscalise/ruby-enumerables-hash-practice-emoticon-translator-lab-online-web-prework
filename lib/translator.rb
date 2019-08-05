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
  list = load_library(file_name)
  
  name = list.find{|item| 
    item[1].any?{| value | 
      value == western_emoticon
    }
  }
  if name
    return name[1][1]
  else
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file_name, japanese_emoticon)
  list = load_library(file_name)
  
  name = list.find{|item| 
    item.any?{| key, value| value == japanese_emoticon
      
    }
  }
  if name
    name.each do |key, value|
      return key.to_s
    end
  else
    return "Sorry, that emoticon was not found"
  end

end
