# CodeWars
Various excerises from 'https://www.codewars.com/' - only exercises for the languages 'R' & 'Python'.

## Overview
CodeWars offerst various exercises to train coding in different coding languages. Currently I'm only focusing on the languages 'R' & 'Python'.   
The difficulty of the exercises ranges from '8Kata' - '1Kata', whereby the exercises with '8Kata' are the most simple ones & exercises with '1Kata' are the most complicated!  
To each language and degree of difficulty there is a seperate 'ipynb'-file. Each file contains up to 10 exercise(s) from codewars, their challenge, the corresponding tests & my implemented solution

## Folder Structure of the Repository:
```
├── README.md       <- Top-level README for devs using this repository
│ 
├── R               <- All CodeWars Exercises for R (8 = easiest <-> 1 = hardest)
│  ├── R_Kata_8	  	<- Exercises in R of difficulity '8' --- 10/10 / all fine
│  ├── R_Kata_7		<- Exercises in R of difficulity '7' --- 08/10 / all fine
│  ├── R_Kata_6		<- Exercises in R of difficulity '6' --- 09/10
│  ├── R_Kata_5		<- Exercises in R of difficulity '5' --- 09/10
│  ├── R_Kata_4		<- Exercises in R of difficulity '4' --- 02/10
│  ├── R_Kata_3		<- Exercises in R of difficulity '3' --- 00/10
│  ├── R_Kata_2		<- Exercises in R of difficulity '2' --- 00/10
│  └── R_Kata_1		<- Exercises in R of difficulity '1' --- 00/10
│
└── Python			<- All CodeWars Exercises for Python (8 = easiest <-> 1 = hardest)
   ├── Py_Kata_8		<- Exercises in Python of difficulity '8' --- 10/10 / all fine
   ├── Py_Kata_7		<- Exercises in Python of difficulity '7' --- 10/10 / all fine 
   ├── Py_Kata_6		<- Exercises in Python of difficulity '6' --- 10/10 / all fine
   ├── Py_Kata_5		<- Exercises in Python of difficulity '5' --- 06/10
   ├── Py_Kata_4		<- Exercises in Python of difficulity '4' --- 01/10
   ├── Py_Kata_3		<- Exercises in Python of difficulity '3' --- 00/10
   ├── Py_Kata_2		<- Exercises in Python of difficulity '2' --- 00/10
   └── Py_Kata_1		<- Exercises in Python of difficulity '1' --- 00/10
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

