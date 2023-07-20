class String

    def bold
      "\e[1m#{self}\e[22m"
    end
  
    def underline
      "\e[4m#{self}\e[24m"
    end
  
    def red
      "\e[31m#{self}\e[0m"
    end
  
    def green
      "\e[32m#{self}\e[0m"
    end

    def blue
        "\e[34m#{self}\e[0m"
    end
  
  end