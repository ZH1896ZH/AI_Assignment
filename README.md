# AI Assignment

- **Authors:** Robin Roth, Christian Roth
- **Semester:** HS 2020

This repository contains the deliverables of the assignment for the modlue "AI-Technologies".
The assignment consitsted of three parts.

- Expert Knowledge (using KE)
- Extracting Knowledge (using ML)
- Combining KE and ML

This document serves as the last delivereable. Namely, a documentation of how the proir steps we relaized.


## Transforming Expert Knowledge into a Knowledge System

The knowledge system chosen for this assignment was the `Prolog`-language.
This because it is the system taught in the course.
The task at hand, was to transform the doucumented knowledge found in the assignment into formal knowldege the system can understand.
The ultimate goal of the system is to feed it a set of people, and have it evaluate, which of them are eligible for an insuarance, which are not and which people are, provided they pay an extra fee.

In order to achieve this, the text needed to be split up in a set of rules.
Before we even started to write any rules in `Prolog`, we created the following desicion tree, that shows, which descisions need to be made, by the system.

![tree](tree/tree.png)

Our defintion of the rules in `Prolog` can be seen in this document [expert.pl](https://github.com/sekthor/ai-assignment/blob/master/expert.pl).


## Knowledge Extraction from Sheet

The knowledge extraction for this assignment is done by a script written in python.
This because it is the system taught in the course.
We used different libraries, such as `scipy.io`, `pandas`, `sklearn`, `matplotlib` and `tensorflow`.
The task at hand, was to analyze the data from former applications,
in order to see which applications result into which risk value.
The data from former applications can be seen in this document [Project_Learning.arff](https://github.com/sekthor/ai-assignment/blob/master/Project_Learning.arff).

We went through the following 9 steps to extract the knowledge out of the data-sheet:
1. Load the data from the file, put it in a pandas-dataframe and transform byte-strings into strings
2. Convert all strings into numbers with a sklearn-encoder:
    - attributes allergies, medications: "yes" --> 1 and "no" --> 0
    - attribut disease: value "cholesterol" --> 0, "diabetes" --> 1, "heart" --> 2 and "no" --> 3
3. Visualize the data by comparing all features with each other.
4. Split the data into feature matrix and target array. The feature matrix contains all attributes except the risk values.
The target matrix contains only the risk values.
5. Split the data into training-set and test-set.
6. Build a model.
7. Fit the model to the training-set.
8. Make a prediction with the testing-set.
9. Compare the accuracy of the predication.

The python script can be seen on [knowledge_extraction.ipynb](https://colab.research.google.com/drive/1YQTKCYbEk49Kla6bi7dIiX1yr1KsCPyY?usp=sharing)


## Combining KE and ML

![combining_model](tree/Combining_KE_ML.png)
