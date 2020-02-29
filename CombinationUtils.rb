module CombinationUtils
    def changeCountListToIndivisualIndexList (countList)
        returnArray = Array.new
        countList.each_with_index do |count, index|
            j = count
            puts "index = #{j}"
            while j > 0
                returnArray.push(Array.new.push(index))
                j -= 1
            end
        end
        return returnArray
    end

    def baseNNumberConvert(n, base, arrayResult)
        q = n / base
        r = n % base
        if q == 0
            arrayResult.unshift(r)
            return arrayResult
        else
            arrayResult.unshift(r)
            return baseNNumberConvert(q, base, arrayResult)
        end
    end

    def getFullCombinationWithGrouping(input, bAllowDuplication)
        totalLength = (input.length) ** (input.length)
        totalList = Array.new
        (0..(totalLength - 1)).each do |i|
            tempList = getCombinationWithGroupingAtIndex(input, bAllowDuplication, i)
            if tempList
                totalList.push(tempList)
            end
        end
        return totalList
    end

    def getCombinationWithGroupingAtIndex(input, bAllowDuplication, index)
        tempList = Array.new
        arrayPosition = Array.new
        baseNNumberConvert(index, input.length, arrayPosition)
        remained = input.length - arrayPosition.length
        (1..remained).each do
            arrayPosition.unshift 0
        end

        (0..(input.length - 1)).each do |j|
            if tempList[arrayPosition[j]] == nil
                tempList[arrayPosition[j]] = Array.new
            elsif !bAllowDuplication and tempList[arrayPosition[j]].include?(input[j][0])
                return nil
            end
            tempList[arrayPosition[j]].push(input[j][0])
        end

        return tempList
    end
end
