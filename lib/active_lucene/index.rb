module ActiveLucene
  module Index    
    @@path = nil
    def initialize
      @@path = "#{APP_ROOT}/db/lucene/#{APP_ENV}" unless @@path
    end

    def self.directory
      FSDirectory.open java.io.File.new(@@path)
    end
    
    def self.path=(value)
      @@path = value
    end
  end
end