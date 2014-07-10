class Season
            @@seasons = {
        
        spring: [3,4,5],
        autumn: [9,10,11],
        winter: [12,1,2],
        summer: [6,7,8] 
        
        }
    attr_reader :name
    def initialize(name)
        if name == "spring"
            @name = "spring"
        elsif name == "winter"
            @name = "winter"
        elsif name == "autumn"
            @name = "autumn"
        elsif name == "summer"
            @name = "summer"
        else
        raise ArgumentError
        end 
    end

    is_seasons_methods = ["spring","winter","autumn","summer"]

    is_seasons_methods.each do |name|

        define_method("is_#{name}?") do 
            if self.name == name
                true
            else
                false
            end
        end
    end

    def has_month?(month)


       
        @@seasons[name.to_sym].include?(month)
    end

    def each_month
        season = @@seasons[name.to_sym]
        for i in 0..season.size-1 do
         yield season[i]
        end
    end

end