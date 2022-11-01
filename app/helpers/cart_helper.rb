module CartHelper
    def calctotal(a)
        total = 0
        a.each do |i|
            total += i
        end
        return total
    end
end
