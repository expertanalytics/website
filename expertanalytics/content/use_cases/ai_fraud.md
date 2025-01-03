---
title: AI-based Financial Fraud Evaluation Assistant
description: Using AI to lower the false-positives in detected fraudulent transactions
cover:
  image: "/uploads/money-7923867_1920.jpg"
showToc: false
ShowBreadCrumbs: true
layout: single_services
tags: ["data_science", "data_engineering", "finance"]
---


For one of our FinTech clients, we were asked to improve their rule-based transaction monitoring system to reduce
the false positives in the detected transactions.This would ultimately reduce the number of cases
the case workers had to go through each day.

We leveraged an AI driven technique to classify output of the transaction monitoring system and report a probability score
on the conviction of each case. Additionally, we implemented reasoning techniques to elaborate on the decision made by
the model for transparency and in order to be able to continuously refine and enhance our model performance.
A full MLOps setup was implemented alongside the models with daily training, model evaluation and serving the model to production.

In the first phase of the deployment, we set a conservative threshold for automatically closing the cases
which are considered highly unlikely to be convicted by the model.
Already this low threshold removed cases equal to the performance of 1 case worker in a week.
