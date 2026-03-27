require_relative 'regexmaker.rb'
require_relative 'Mime'

class Router

  attr_reader :routes
  attr_reader :block #kanske returnerar fel sak?

  def initialize()
    @routes = []
  end

  def get(resource, &block)
    mysuperregex = regexmaker(resource)
    @routes << {method: "GET", resource: mysuperregex, block: block}
  end

  def post(resource, &block)
    @routes << {method: "POST", resource: resource, block: block}
  end

  def match(request)

    found = false
    @routes.each do |rot|
      method = rot[:method]
      resource = rot[:resource]
      if request.method == method && request.resource.match?(resource)
        found = true
        banan = request.resource.match(resource)
        captures = banan.captures
        @block = rot[:block].call(captures)
      end
      if found
        break
      end
    end
    return found
  end

end