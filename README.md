## Production Planning 

### 
Ford Motor Company plans to launch new production lines next year, each capable of manufacturing specific types of vehicles. Detailed data are provided regarding the cost and time capacity of each line, as well as the time required to produce each vehicle type.

Constraints:

1. Due to mechanical and financial limitations, the company can operate a maximum of 3 production lines. Lines 4 and 5 cannot be launched simultaneously.

2. To maintain its market share, the company must produce and sell at least 18,000 vehicles, including a minimum of 4 different models.

3. If a single vehicle type is selected for production, at least 1,500 units of that type must be produced.

4. According to a contract with a construction company, Ford must produce at least 1,500 units of the "VANT" vehicle. Failure to meet this target results in a $3.5 million penalty.

5. Based on market research, customer preference leans heavily toward SUVs. Therefore, at least 63% of family-class vehicle production (excluding VANT and VAN) must consist of SUVs.

6. Due to environmental regulations, the total engine volume of three models—AG, Explorer, and Mustang (with engines of 3600cc, 2400cc, and 7200cc)—must not exceed 32,000 liters in total.

The linear programming model to maximize revenue under the given constraints was developed and implemented using GAMS.
