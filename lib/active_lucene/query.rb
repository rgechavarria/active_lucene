module ActiveLucene
  class Query

    def self.for(param, opts={})
      if param.instance_of? Hash
        for_attributes param
      elsif param.instance_of? Symbol
        for_string "#{TYPE}:#{opts[:class]}"
      else
        for_string param
      end
    end

    private

    def self.for_attributes(attributes)
      returning BooleanQuery.new do |query|
        attributes.each do |key, value|
          query.add WildcardQuery.new(ActiveLucene::Term.for(key, value)), BooleanClause::Occur::MUST
        end
      end
    end

    def self.for_string(string)
      StandardQueryParser.new(StandardAnalyzer.new(Version::LUCENE_34)).parse(string, ALL)
    end
  end
end
