![alt text](https://w7.pngwing.com/pngs/477/603/png-transparent-codewars-button-icon.png)  
  
  
https://www.codewars.com/ is a coding practice site for all programmers where you can learn various programming languages. It offers programming challenges in various languages, whereby the difficulty of the challenges ranges from **8Kata** *(easiest)* to **1Kata** *(hardest)*.   
For each language and degree of difficulty there is a seperate 'ipynb'-file w/ exercise from codewars, their actual challene & corresponding tests, as well as my solution.  

## Folder Structure:
```
├── README.md       <- Top-level README for devs using this repository
│ 
├── R 			<- R Challenges
│  ├── R_Kata_8	  	<- Exercises in R of difficulity '8' --- 10 
│  ├── R_Kata_7		<- Exercises in R of difficulity '7' --- 10
│  ├── R_Kata_6		<- Exercises in R of difficulity '6' --- 10 
│  ├── R_Kata_5		<- Exercises in R of difficulity '5' --- 10
│  ├── R_Kata_4		<- Exercises in R of difficulity '4' --- 02
│  ├── R_Kata_3		<- Exercises in R of difficulity '3' --- 00
│  ├── R_Kata_2		<- Exercises in R of difficulity '2' --- 00
│  └── R_Kata_1		<- Exercises in R of difficulity '1' --- 00
│
└── Python			<- Python Challenges  
   ├── Py_Kata_8		<- Exercises in Python of difficulity '8' --- 10
   ├── Py_Kata_7		<- Exercises in Python of difficulity '7' --- 10 
   ├── Py_Kata_6		<- Exercises in Python of difficulity '6' --- 10
   ├── Py_Kata_5		<- Exercises in Python of difficulity '5' --- 08
   ├── Py_Kata_4		<- Exercises in Python of difficulity '4' --- 01
   ├── Py_Kata_3		<- Exercises in Python of difficulity '3' --- 00
   ├── Py_Kata_2		<- Exercises in Python of difficulity '2' --- 00
   └── Py_Kata_1		<- Exercises in Python of difficulity '1' --- 00
```

## Enviroment Details
To run R code from the jupyter notebooks, install the following enviroment:
```
conda create -yn CodeWars r-base=3.5.1 r-irkernel python=3.7 notebook
conda activate CodeWars
conda install r-testthat
pip install pandas
jupyter notebook
```

