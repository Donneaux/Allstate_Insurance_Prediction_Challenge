// cluster states, cluster times, create equation for each value of each letter :/ , 

* import train_purchases_only_cleaned.xlsx
* import test_v2_cleaned.csv

drop location
destring, replace

*drop if record_type == 0 // remove all shopping points that did not result in a purchase
*drop record_type  // remove variable (all are ones)

* shopping_pt:

* day: 
tab day, gen(day) // tabulate day variable to create dummy variables
drop day // remove variable
rename day1 Mon // replace with names that are easier to recongnize
rename day2 Tues
rename day3 Wed
rename day4 Thur
rename day5 Fri
rename day6 Sat
drop day7

// time: need to cluster
tab time, gen(time)
drop time

// state:
sort state
tab state, gen(state) // tabulate state variable to create dummy variables
drop state
rename state1 AL
rename state2 AR
rename state3 CO
rename state4 CT
rename state5 DC
rename state6 DE
rename state7 FL
rename state8 GA
rename state9 IA
rename state10 ID
rename state11 IN
rename state12 KS
rename state13 KY
rename state14 MD
rename state15 ME
rename state16 MO
rename state17 MS
rename state18 MT
rename state19 ND
rename state20 NE
rename state21 NH
rename state22 NM
rename state23 NV
rename state24 NY
rename state25 OH
rename state26 OK
rename state27 OR
rename state28 PA
rename state29 RI
rename state30 SD
rename state31 TN
rename state32 UT
rename state33 WA
rename state34 WI
rename state35 WV
drop state36

sort customer_ID // sort customer_id for test data
drop customer_ID // do not drop customer_id for test data

// car_value:
tab car_value, gen(car_values) // tabulate car_value variable to create dummy variables
drop car_value 
rename car_values1 car_valueA  // replace with names that are easier to recongnize
rename car_values2 car_valueB
rename car_values3 car_valueC
rename car_values4 car_valueD
rename car_values5 car_valueE
rename car_values6 car_valueF
rename car_values7 car_valueG
rename car_values8 car_valueH
drop car_values9


export excel using "C:\Users\Collin\Desktop\Collin\MBA\Data Analytics certificate\Capstone\Data\train_final_database.xlsx", firstrow(variables) replace

*sw, pr(.05): reg A shopping_pt group_size homeowner car_age risk_factor age_oldest age_youngest married_couple C_previous duration_previous first_insurance cost Mon Tues Wed Thur Fri Sat time1 time2 time3 time4 AL AR CO CT DC DE FL GA IA ID IN KS KY MD ME MO MS MT ND NE NH NM NV NY OH OK OR PA RI SD TN UT WA WI WV car_valueA car_valueB car_valueC car_valueD car_valueE car_valueF car_valueG car_valueH
