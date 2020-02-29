# AllCombinationWithGrouping_ruby

This is for creating all possible combination of Array if the input is an Array that each element is the number of items with their position.  
The example of input and output is as below.  

input : [2, 1, 1]  
transformed format : [0, 0, 1, 2]  
output :   
  [[0, 0, 1, 2]]  
  [[0, 0, 1], [2]]  
  [[0, 0, 1], nil, [2]]  
  [[0, 0, 1], nil, nil, [2]]  
  [[0, 0, 2], [1]]  
  [[0, 0], [1, 2]]  
  [[0, 0], [1], [2]]  
  [[0, 0], [1], nil, [2]]  
  ....  
  [nil, nil, [2], [0, 0, 1]]  
  [nil, nil, nil, [0, 0, 1, 2]]  
  
I recommand using getCombinationWithGroupingAtIndex() instead of getFullCombinationWithGrouping due to the stack overflow
