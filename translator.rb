class H248_Translator
    def translate(h248_string)
        result_string = ""
        h248_string.split("\n").each do |line|
            matchdata = /^([a-zA-Z]+-?)+/.match(line)
            result_line = ""
            matchdata.to_s.split("-").each do |item|
                result_line << "-"
                puts item
                result_line << convert(item)
            end
            result_line << matchdata.post_match
            result_line[0] = ''
            result_string << result_line
            result_string << "\n"
        end
        return result_string
    end

    def convert(string)
        return "Media"
    end
end

ht = H248_Translator.new
puts ht.translate("MC=8\nTB=7")
