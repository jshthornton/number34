require 'yaml'

module Number34
  class CapabilitiesHelper

    def self.get_collection(map, key = '__all__')
      return map[key] unless key == '__all__'

      map.values.flatten
    end
  end
end