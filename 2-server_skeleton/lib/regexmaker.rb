#https://rubular.com/
def regexmaker(resource)
      
      res = resource
      regexpbuilder = //
      if res.match?(/(\/:\w+)+/)
            res = Regexp.new(res)
            new_pattern = res.source.gsub(/\/:\w+/, "\/(\\w+)+")
            return regexpbuilder = Regexp.new(new_pattern)
      else
            return Regexp.new("^" + res + "$")
      end

end