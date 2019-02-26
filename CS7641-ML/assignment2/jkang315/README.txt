All of the algorithms were run using ABAGAIL, code was modified using Sublime Text 2 (Build 3083), and data was pre-processed and post-processed on Microsoft Excel 2011 on a Mac OSX 10.10.5.

Make sure to compile in the root directory using ant have the ABAGAIL library installed. 

Included in the folders are:
- Three scripts to run both parts of assignment: runNNCar.sh, runCar.sh, and runTests.sh

 - Four data files (in ABAGAIL/src/opt/test): carTest-features, 
                                              carTest-labels,
                                              carTraining-features,
                                              carTraining-labels.

 - First part of assignment: CarTest.java (in ABAGAIL/src/opt/test),
                             Results-processed.csv (in ABAGAIL/data)

- Second part of the assignment: FlipFlopTestjk.java,
                               FourPeaksTestjk.java,
                               MaxKColoringTestjk.java,
                               NQueensTestjk.java,
                               TravelingSalesmanTestjk.java(in ABAGAIL/src/opt/test)
                                   FlipFlopTestjk.csv,
                               FourPeaksTestjk.csv,
                               MaxKColoringTestjk.csv,
                               NQueensTestjk.csv,
                               TravelingSalesmanTestjk.csv(in ABAGAIL/results)
                                                              

To run code, use command line scripts:
./runNNCar.sh > NNresults.csv
./runCar.sh > results.csv
./runTests.sh

./runNNCar.sh returns results in the NNresults.csv file in the root directory.

./runCar.sh returns results in the results.cv file in the root directory (edited and stored as Results-processed.csv in ABAGAIL/data).

./runTests.sh returns results in results folder for each test. 



