require_relative "CombinationUtils.rb"
include CombinationUtils

def calculateCost(paramBooks)
    returnValue = 0.0
    paramBooks.each_with_index do |item, index|
        next if item == nil
        returnValue += item.length * 8
        percent = 0
        case item.length
        when 2
            percent = 5
        when 3
            percent = 10
        when 4
            percent = 20
        when 5
            percent = 25
        end
        returnValue -= (item.length * 8) * percent / 100.0
    end
    return returnValue
end

def getMinimumCostIndex (tempList)
    totalLength = tempList.length
    puts "totalLength = #{totalLength}"
    minimumCost = nil
    minimumCostIndex = nil
    minimumCost = 99999999
    minimumCostIndex = -1

    (1..(totalLength - 1)).each do |i|
        next if tempList[i] == nil
        tempCost = calculateCost(tempList[i])
        if tempCost < minimumCost
            minimumCost = tempCost
            minimumCostIndex = i
        end
    end
    return minimumCostIndex
end

books = [2, 2, 2, 1, 1]
# books = [1, 1, 1, 1, 1]
input = changeCountListToIndivisualIndexList(books)
p input

resultCost = nil
resultList = nil

totalLength = (input.length) ** (input.length)
(0..(totalLength - 1)).each do |i|
    tempList = CombinationUtils.getCombinationWithGroupingAtIndex(input, false, i)
    if tempList
        tempCost = calculateCost(tempList)
        if resultCost == nil or tempCost < resultCost
            resultCost = tempCost
            resultList = *tempList
        end
    end
end

p resultList
p resultCost

# resultIndex = getMinimumCostIndex(fullList)
# p calculateCost(fullList[resultIndex])
# p fullList[resultIndex] 

