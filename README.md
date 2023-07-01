# sql-challenge

## Introduction/Premise

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, respectively.

## Summary

This repository contains the outputs for the modelling, engineering and analysis of the EmployeeSQL csv files. 

Modelling: ERD diagram (ERD.jpg) generated with QuickDatabaseDiagrams.com shows the relationship between the tables and sets up the SQL table creation

Engineering: Tables schema (tables_schema.sql) includes the queries for setup of the tables in pgAdmin, where they can then be imported.

Analysis: The analysis queries (queries.sql) includes the answers to the provided questions, with associated screenshots of results in (images) folder as Question01.jpg, Question02.jpg, etc..

## Citations

TO_DATE

-- https://www.rudderstack.com/guides/queries-casting-postgresql/#:~:text=The%20TO_DATE%20function%20in%20PostgreSQL,to_timestamp(text%2C%20text)%20.

DATE_PART

-- https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-date_part/

I struggled a fair bit with the date formatting. At first, attempts to import the csv were failing because I tried to make the birth_date and hire_date as DATE variables in pgAdmin. This was failing because the csv file contained dates that were not in postgresql's default ISO format. I tried to change the DATESTYLE in pgAdmin, but was unable to successfully import the file.

These failures led me to import the dates as VARCHAR and then parse them as dates afterwards. This was done using the TO_DATE and DATE_PART commands I found at the links above. 