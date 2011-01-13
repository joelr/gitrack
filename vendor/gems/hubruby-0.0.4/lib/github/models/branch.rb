require 'ostruct'

module GitHub
  class Branch < OpenStruct
    def self.from_hash(h)
      new(h)
    end
    def self.branches_from_hashes(h)
      h.inject([]) do |repositories, repository_attrs|
        repositories <<  repository_attrs
      end
    end
  end
end
