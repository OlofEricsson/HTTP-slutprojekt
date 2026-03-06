class Router

  attr_reader :routes

  def initialize()
    @routes = []
  end

  

  def get(resource, &block)
    #mysyperregex =  build this from resource "/add/:num1/:num2" 
    @routes << {method: "GET",resource: v, block: block} #v ska vara mysuperegex resultataet tror jag
  end

  def post(resource)

    content = yield
    @routes << {method: "POST", resource: resource, html: content}
  end

end