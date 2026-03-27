# https://rubydoc.info/gems/yard/file/docs/GettingStarted.md

class Response

  def initialize(session)
    @session = session
  end



  # Prints to the session
  # 
  # @param status [Integer] the status of the http request
  # @param block [String] the body of the http request
  # @param content_type [string] the mime type of the http request
  # @return [void]
  def respond(status, block, content_type)
    p block
    content_length = block.bytesize
    @session.print "HTTP/1.1 #{status}\r\n"
    @session.print "Content-Type: #{content_type}\r\n"
    @session.print "Content-Length: #{content_length}\r\n"
    p ("Content-Type: #{content_type}\r\n")
    @session.print "\r\n"
    @session.print block
    @session.close
  end