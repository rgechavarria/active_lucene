module ActiveLucene
  module Index
    PATH = "#{APP_ROOT}/db/lucene/#{APP_ENV}"
    @@path = PATH

    def self.directory
      FSDirectory.open java.io.File.new(@@path)
    end
    
    def self.path=(value)
      @@path = value
    end
  end
end