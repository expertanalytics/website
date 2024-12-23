---
title: Treat Smart
description: We developed an application that uses a machine learning model trained on operational and weather data to predict the rate and composition of wastewater, optimizing chemical usage and reducing costs at treatment plants.
cover:
  image: uploads/water_treatment.jpg
showToc: false
ShowBreadCrumbs: true
layout: single_services
tags: ["data_science", "processing"]
---


The amount of waste water that enters waste water plants is highly dependent on the time of day and of weather conditions.
During periods of snow melt or heavy precipitation, the ground water level is high and foreign water enters cracks in
the sewer pipes.
This large variability in rate and composition makes it challenging to estimate the appropriate dose of chemicals needed
to clean the waste water following regulations.
Our customer was an automation company that wanted to both predict the rate of waste water on the inlet of a plant
and estimate the composition of the sewer.
The goal was to optimize the usage of chemicals.

### Approach

To predict wastewater flow, we applied machine learning algorithms (XGBOOST, LSTM)
using weather data from Norges vassdrags- og energidirektorat (NVE) and Open-Meteo
APIs. By incorporating time-based features and relevant environmental variables, we
improved prediction accuracy and effectively captured the cyclical patterns of water flow.

To support monitoring and decision-making, we developed a Streamlit application that allows
users to train machine learning models and compare different models and feature sets to
identify the most effective configuration. Once the optimal model is selected, the application
displays real-time predictions alongside actual water flow measurements and relevant
weather data. This setup enables clients to continuously evaluate model performance by
comparing observed data against predictions.

To make the predictions understandable, we integrated SHAP (SHapley Additive
exPlanations) to identify the key factors driving each forecast. Additionally, we used
OpenAI’s API to generate clear verbal explanations based on SHAP values and weather
data, helping plant operators understand the reasons behind the predictions.

### Impact

The solution delivered accurate water flow predictions and effectively managed missing
data, enhancing the reliability and flexibility of forecasting. It provided control over model
configurations and included explainable AI features, allowing developers and end-users to
understand the factors influencing predictions. Additionally, the real-time dashboard
supported decision-making, enabling the client to manage wastewater operations with
precise and actionable insights.

The amount of chemicals used has decreased, as reported by the client.
