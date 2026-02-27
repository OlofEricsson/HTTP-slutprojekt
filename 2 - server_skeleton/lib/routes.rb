class Router

  attr_reader :routes

  def initialize()
    @routes = []
  end

  def get(resource)

    content = yield
    @routes << {method: "GET", resource: resource, html: content}

  end

  def post(resource)

    content = yield
    @routes << {method: "POST", resource: resource, html: content}
  end
end