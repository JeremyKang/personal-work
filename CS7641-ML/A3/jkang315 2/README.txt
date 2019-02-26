All of the algorithms were ran using WEKA GUI Experimenter and Explorer (Version 3.7.13) on a Mac OSX 10.10.5.

Included are:
- data folder containing raw and preprocessed data.

- Results for the ICA, PCA, and RCA algorithms are in each corresponding folder in the results folder.
	The reduced data in them are:
		car-[P/I/R]CA.csv
		cmc-[P/I/R]CA.csv

	Cluster analysis:
		car-KMeans-[P/I/R]CA-Result-Buffer.txt
		cmc-KMeans-[P/I/R]CA-Result-Buffer.txt
		car-EM-[P/I/R]CA-Result-Buffer.txt
		cmc-EM-[P/I/R]CA-Result-Buffer.txt

- ANN folder contains:
	ANN-results.xls: Graphs of ANN on clusters
	car-KMeans-cluster[0-3].csv: Euclidean distance data
	car-[P/I/R]CA-ANN.txt: Output
	
- Output and WEKA configuration setup are included in the corresponding folder. 
