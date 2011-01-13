require 'ostruct'

module GitHub
  class Commit < OpenStruct
    def self.from_hash(h)
      new(h)
    end

    def self.commits_from_hashes(h)
      h.inject([]) do |repositories, repository_attrs|
        repositories << from_hash(repository_attrs)
      end
    end

   
  end
end
