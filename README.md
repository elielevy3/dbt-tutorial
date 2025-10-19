# 🧠 DBT Masterclass

Welcome to the **DBT Masterclass** project!  
This repository was created to support an internal training session designed to help colleagues learn how to use **dbt (data build tool)** — from theory to hands-on practice.

---

## 🚀 Overview

This masterclass combines **theoretical explanations** and **practical exercises** to introduce key dbt concepts and workflows used in modern data engineering.

The goal is to help you:
- Understand what dbt is, why it’s valuable and how it's different from Spark
- Learn how to set up a quick DBT project
- Get hands-on experience building models, testing, and documenting data transformations

---

## 🧩 Project Structure

- velib:
   - Analyses:
      - `most_used_start_station.sql`
   - Macros:
      - `add_day_of_the_week.sql`
   - Models:
      - aggregate
      - enhanced_trips
      - stations
      - trips
   - Seeds:
      - `zip_codes.csv`
   - Snapshots:
   - Tests:
      - `negative_trips.sql`
- Dockerfile


## ⚙️ How to Set-up ? 

### ☁️ GCP

- Create a GCP project
- Go to `...` in project id (left side panel)
- Create data set
- Pick region us-xxx and fill a data set ID that you will remember
- Click on `CREATE DATA SET`
- **Save this id**
- Generate a key with a service account and save this key on your computer (json file)

### 🐋 Docker

- Make sure you have docker operational with `docker info`
- Build docker image with `docker build -t dbt-image .` (careful, you need to be in the fold when Dockerfile is located)
- Run conteneur with `docker run -di -t --name dbt-service -v $(pwd):/usr/app -d <id_image>`
- Get into the conteneur with `docker exec -ti dbt-service sh`
- Get into folder `user/app` inside your conteneur
- Clone repo inside `/user/app` conteneur -> `git clone https://github.com/elielevy3/dbt-tutorial.git`
- Copy the key generated from GCP and put it in `/user/app`
- Update `profiles.yml` inside .dbt in order to put keyfile and change dataset id to use the one you have created in GCP
- Run dbt debug in the cloned project to make sure everything works fine

### 🍺 Homebrew (for those who did not use Docker)

- `brew update` (:warning::warning: This can take up some time :warning::warning:)
- `brew tap dbt-labs/dbt`
- `brew install dbt-bigquery`
- Git clone this projects in the current folder -> `git clone https://github.com/elielevy3/dbt-tutorial.git`
- Copy the key you generated from GCP service account
- Update `profiles.yml` in `.dbt` (in `~/`) in order to put it the path of your `keyfile` as well as put the id of the dataset you created
- Run `dbt debug` in the project you created to make sure everything works fine

## Theorerical part

<img width="999" height="840" alt="image" src="https://github.com/user-attachments/assets/30aa4467-5b79-4b44-aa47-86d331314c6a" />
<img width="984" height="896" alt="image" src="https://github.com/user-attachments/assets/93af0abb-1806-4a09-8c17-70eaf7d3d74d" />
<img width="993" height="586" alt="image" src="https://github.com/user-attachments/assets/d9d3e570-129f-4cf9-affd-323c0abe6752" />

## Practical part


