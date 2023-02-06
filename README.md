![alt text](https://w7.pngwing.com/pngs/477/603/png-transparent-codewars-button-icon.png)  
  
https://www.codewars.com/ is a web-site for all programmers that want to practice their coding in various programming languages. It offers programming challenges in various languages, whereby the difficulty of the challenges ranges from **8Kata** *(easiest)* to **1Kata** *(hardest)*.   
For each language and degree of difficulty there is a seperate file w/ exercises from codewars. To each exercise we have the actual challenge & corresponding tests, as well as my personal solution to it.    
Currently I'm focusing on the languages **R**, **Python** & **SQL**.

## Folder Structure:
```
├── README.md  <- Top-level README for devs using this repository
│
├── SQL			<- SQL Challenges 
│  ├── Beginners-Series <- Series from CodeWars to start with SQL --- 06 
│  ├── 8_Kata	  	      <- Exercises in SQL of difficulity '8'    --- 10
│  ├── 7_Kata	  	      <- Exercises in SQL of difficulity '7'    --- 10
│  └── 6_Kata	  	      <- Exercises in SQL of difficulity '6'    --- 07
│
├── R 			<- R Challenges
│  ├── R_Kata_8	  	<- Exercises in R of difficulity '8' --- 12
│  ├── R_Kata_7		<- Exercises in R of difficulity '7' --- 11
│  ├── R_Kata_6		<- Exercises in R of difficulity '6' --- 12  
│  ├── R_Kata_5		<- Exercises in R of difficulity '5' --- 10
│  └── R_Kata_4		<- Exercises in R of difficulity '4' --- 04
│
└── Python		<- Python Challenges  
   ├── Py_Kata_8		<- Exercises in Python of difficulity '8' --- 11
   ├── Py_Kata_7		<- Exercises in Python of difficulity '7' --- 12 
   ├── Py_Kata_6		<- Exercises in Python of difficulity '6' --- 11
   ├── Py_Kata_5		<- Exercises in Python of difficulity '5' --- 10
   └── Py_Kata_4		<- Exercises in Python of difficulity '4' --- 01 
```

## Enviroment Details
To run R code from the jupyter notebooks, install the following enviroment:
```
conda create -n CodeWars
conda activate CodeWars
conda install r-recommended r-irkernel
conda install Jupyter
R -e 'IRkernel::installspec()'
conda install r-testthat # 'testthat'-package for R
jupyter-notebook 
```