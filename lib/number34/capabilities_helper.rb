require 'yaml'

module Number34
  class CapabilitiesHelper

    def self.get_collection(map, keys = '__all__')
      return map.values.flatten if keys == '__all__'

      keys = Array(keys)
      collection = []
      keys.each do |key|
        collection.concat map[key]
      end
      collection
    end
  end
end