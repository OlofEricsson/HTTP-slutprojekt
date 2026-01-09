class Request

  def initialize(fileContent)
    @content = fileContent
    #p(@content)
    @content = @content.split(/\r?\n/)
    row1, row2, row3, row4 = @content
    #p("row1: #{row1}")
    @method, @resource, @version = row1.split(" ")
    host, hoster = row2.split(": ")
    acc_lang, lang = row3.split(": ")
    @headers = {host => hoster, acc_lang => lang}
    @params = row4 = {}
    p(@params)

  end

  def resource()
    return @resource
  end

  def resource()
    return @resource
  end

  def resource()
    return @resource
  end

  def resource()
    return @resource
  end
  
  def resource()
    return @resource
  end

end

#txt = File.readlines("../get-examples.request.txt")
#req = Request.new(txt)
#p req