require_relative 'regexmaker.rb'

class Router

  attr_reader :routes

  def initialize()
    @routes = []
  end

  

  def get(resource, &block)
    #mysyperregex =  build this from resource "/add/:num1/:num2" 
    mysuperregex = regexmaker(resource)
    @routes << {method: "GET",resource: mysuperregex, block: block} #v ska vara mysuperegex resultataet tror jag
  end

  def post(resource)

    content = yield
    @routes << {method: "POST", resource: resource, html: content}
  end

  def post(resource, &block)
    #mysyperregex =  build this from resource "/add/:num1/:num2" 
    @routes << {method: "POST",resource: resource, block: block} #v ska vara mysuperegex resultataet tror jag
  end

end