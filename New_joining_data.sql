WITH joined AS (
    SELECT
        COALESCE(p.Player, s.Player) AS Player,

        -- Keep MP only from per_game
        p.MP AS MP,

        ----------------------------------------------------
        -- Per-game stats (Per_game_player_data)
        ----------------------------------------------------
        p.Age AS Age_pg,
        p.Team AS Team_pg,
        p.Pos AS Pos_pg,
        p.G AS G_pg,
        p.GS AS GS_pg,
        p.FG AS FG_pg,
        p.FGA AS FGA_pg,
        p.FG1 AS FGpct_pg,
        p._3P AS ThreeP_pg,
        p._3PA AS ThreePA_pg,
        p._3P1 AS ThreePpct_pg,
        p._2P AS TwoP_pg,
        p._2PA AS TwoPA_pg,
        p._2P1 AS TwoPpct_pg,
        p.eFG AS eFGpct_pg,
        p.FT AS FT_pg,
        p.FTA AS FTA_pg,
        p.FT1 AS FTpct_pg,
        p.ORB AS ORB_pg,
        p.DRB AS DRB_pg,
        p.TRB AS TRB_pg,
        p.AST AS AST_pg,
        p.STL AS STL_pg,
        p.BLK AS BLK_pg,
        p.TOV AS TOV_pg,
        p.PF AS PF_pg,
        p.PTS AS PTS_pg,
        p.Awards AS Awards_pg,

        ----------------------------------------------------
        -- Salary data (Salary_data)
        ----------------------------------------------------
        s.Tm AS Team_salary,
        s._2025_26,
        s._2026_27,
        s._2027_28,
        s._2028_29,
        s._2029_30,
        s._2030_31,
        s.Guaranteed

    FROM dbo.Per_game_player_data p
    FULL OUTER JOIN dbo.Salary_data s
        ON p.Player = s.Player
)

SELECT *
FROM joined
WHERE Player IS NOT NULL
  AND Team_pg IS NOT NULL
  AND Team_salary IS NOT NULL;
