module Searchable
    extend ActiveSupport::Concern
  
    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks
  
      mapping  do
        indexes :text, type: :text, analyzer: 'english'
      end
  
      def self.search(query)
        params = {
          query: {
            multi_match: {
              query: query,
              fields: ['text'],
              fuzziness: "AUTO"
            }
          }
        }
  
        self.__elasticsearch__.search(params).records.to_a
      end    
    end
  end