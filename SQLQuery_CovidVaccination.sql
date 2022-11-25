

Select *
From CovidVaccination
Where continent is not NULL
Order by 3, 4

-- Select the data will be used

Select continent, location, date, total_cases, total_deaths, total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters, population
FROM CovidVaccination
Where continent is not NULL
Order by 2, 3

-- Total cases VS Total deaths

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
From CovidVaccination
Order by 1, 2

-- Total cases VS Population

Select location, date, total_cases, population, (total_cases/population)*100 as infected_percentage
From CovidVaccination
Order by 1, 2

--Total vaccination VS Population

Select location, date, total_vaccinations, population, (total_vaccinations/population)*100 as total_vaccination_percentage
From CovidVaccination
Order by 1, 2

--1. Total number of people deaths/ cases/ deaths % globally

Select SUM(new_cases) as global_total_cases, SUM(cast(new_deaths as int)) as global_total_deaths, SUM(cast(new_deaths as int))/ SUM(new_cases)*100 as Global_death_percentage
From CovidVaccination
where continent is not null 

--2. People vaccinated VS People fully vaccinated VS People got booster

Select location, date, (people_vaccinated/population)*100 as people_vaccinated_persentage, 
(people_fully_vaccinated/population)*100 as persent_people_fully_vaccinated,
(total_boosters/population)*100 as persent_total_boosters
From CovidVaccination
Order by 1, 2
Group by 'location'

--3. Total vaccine distribution & Total deaths distribution

Select Location, Population, MAX(total_vaccinations) as TotalVaccination, MAX(total_deaths) as TotalDeaths,  MAX(total_vaccinations)/population * 100 as TotalVaccination_Percentage, Max((total_deaths)/population)*100 as TotalDeaths_Percentage
From CovidVaccination
Group by Location, Population
order by TotalDeaths_Percentage desc

--4. Daily vaccination tracking

Select location, date, (new_vaccinations/population) * 100 as NewVaccination_Percentage
From CovidVaccination
Order by 1, 2