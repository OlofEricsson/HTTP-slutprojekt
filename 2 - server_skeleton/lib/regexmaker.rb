#https://rubular.com/


#Den här konverteringen är det som ska bli resorce i routen, aka dehär är mysuperregex funktionen
#regex har inte "" i sina uttryck kom ihåg

=begin

res = "/add/:num1/:num2"
#ska bli 
"/^\/add\/(?<num1>\d+)\/(?<num2>\d+)$/" #dehär ska bli resource som sparas i routen så att det sedan går att jämföra med requesten yäää

# Regexp.new(str) #sparas i resource

#   irb(main):010> "/add/3/5".match(/^\/add\/(?<num1>\d+)\/(?<num2>\d+)$/)[:num1]
#   => "3"

#   irb(main):012> "hej hopp banan".gsub(" ", ":")
#   => "hej:hopp:banan"

res.gsub("/", ) #konvertera "/" till regex
res.gsub(":foo",) # kovertera ":foo" till regex som kollar om första tecknet mellan två "/" är ":"

x = Regexp.new("^\/add\/(?<num1>\d+)\/(?<num2>\d+)$")
p (x)
#   => /^\/add\/(?<num1>d+)\/(?<num2>d+)$/

p (Regexp.new(":"))

=end

def regexmaker(resource)
      
      res = resource
      regexpbuilder = //
      if res.match?(/(\/:\w+)+/) #kollar om strängen innehåller en ordförld efter "/" med ett ":"och några tecken
            res = Regexp.new(res)

            new_pattern = res.source.gsub(/\/:\w+/, "\/(\\w+)+")

            
            return regexpbuilder = Regexp.new(new_pattern)
      else
            return res
      end

end

=begin
p regexmaker("fgh/:jk/bhubb/:banan")
 (\/:\w+)+


p regexmaker("/add/:banan/and/:paj")
p /\/add(\/\w+)+\/and(\/\w+)+/

if "/add/3/and/7".match?(/\/add(\/\w+)+\/and(\/\w+)+/)
      p true
else
      p false
end
=end

p regexmaker("/hej/:banan/dig/:paj")
p /\/hej(\/\w+)+\/dig(\/\w+)+/