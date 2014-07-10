require 'net/http'
require 'json'
module Github

  class User
    attr_accessor :name
    def initialize(name = [])
      @name = name
    end
    def self.all_users
      users = []
      uri = URI('https://api.github.com/users')
      result = JSON.parse(Net::HTTP.get(uri),symbolize_names:true)
      result.each { |a| users.push(a[:login]) }
      users
    end

    def info
      uri = URI("https://api.github.com/users/#{name}")
JSON.parse(Net::HTTP.get(uri),symbolize_names:true) # !> assigned but unused variable - result
end

def id
  info[:id]
end

	def repos
	if info.include?(:message)
	return []  
	else
	uri = URI("https://api.github.com/users/#{name}/repos")
	JSON.parse(Net::HTTP.get(uri),symbolize_names:true) # !> assigned but unused variable - result
	end
	end

def repos_names

  b = []
  repos.each { |a| b << a[:name] }
  b
#b.collect! { |x| x << repos[:name] }


end

def total_repos_size
  size = 0
  repos.each { |a| size += a[:size] }
  size
end

def prefferable_languages
  if info.include?(:message)
    return [] 
  else
    a = []
    repos.each { |b| a << b[:language] }
    a.compact.uniq

  end
end

end
end