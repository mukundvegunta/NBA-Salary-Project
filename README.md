The goal of this project is to use a predictive model to generate fair salary expectations for players based on league averages for players with similar stats. 
I first joined player salary data with player game stats using a full outer join in SQL. Next, I used Python to clean the dataset to fit my model needs and fit an OLS Model. However, I realized that OLS regression was not the best
predictive model, so I switched to an ANOVA Model. After successfully adding columns that representing the player's predicted salary, I exported the dataframe to visualize in Tableau.
Finally, I used Tableau filters to create an interactive visualization in which the user can filter by team to see which players in their team would be consider underpaid or overpaid based on their in-game statistics.
