# Pewlett-Hackard-Analysis

## Results
Pewlett-Hackard is an established technology company investigating business continuity strategies to address a projected increase in retirements in key positions. Pewlett-Hackard believes that it can set up a mentorship program which will pair prospective retirees with a junior employee. The goal of the program will be to lessen the impact of the reirements by passing knowledge to the next generation before they leave.

## Summary

Pewlett-Hackard (PH) has a large numnber of employees leaving the organization over a four year period. The number of employees that PH has identified for the mentorship program is not sufficient to backfill all key roles. In some roles the retirements will be particularily acute. This means that PH needs to consider other ways to backfill the potential vacancies. The following are the key takeaways from the analysis:

  1. The company currently has 300,024 employees, it's projected that 90,398 employees will retire (or 30% of PH workforce). [Potential Retirements by Role](https://github.com/ryanmorin/pewlett-hackard-analysis/blob/main/queries/unique_titles.csv)
  2. PH has identified 550 employees to be part of its mentorship program. This is less than 1% of the forecasted retirements. [Mentorship Data](https://github.com/ryanmorin/pewlett-hackard-analysis/blob/main/queries/mentorship_eligibility.csv)
  3. Some positions will be harder hit by projected employee departures: Assistant Engineer will see 79% of employees retire and Engineer will see 67% of its employees retire. [% Retirement by Title](https://github.com/ryanmorin/pewlett-hackard-analysis/blob/main/queries/retiring_%25_ttl.csv)
  4. Assuming employees retire at age 65, the retirements are expected to occur over a four year period.  Generally the retirements will occur linearly by role over that four year period with 25% of the retirements per role occurring each year. [% Retirement by Title](https://github.com/ryanmorin/pewlett-hackard-analysis/blob/main/queries/roles_by_retirement_year.csv)
