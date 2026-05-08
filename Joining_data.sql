WITH joined AS (
    SELECT
        COALESCE(p.Player, a.Player, s.Player) AS Player,

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
        -- Advanced stats (Advanced_stats) — MP removed
        ----------------------------------------------------
        a.Age AS Age_adv,
        a.Team AS Team_adv,
        a.Pos AS Pos_adv,
        a.G AS G_adv,
        a.GS AS GS_adv,
        a.FG AS FG_adv,
        a.FGA AS FGA_adv,
        a.FG1 AS FGpct_adv,
        a._3P AS ThreeP_adv,
        a._3PA AS ThreePA_adv,
        a._3P1 AS ThreePpct_adv,
        a._2P AS TwoP_adv,
        a._2PA AS TwoPA_adv,
        a._2P1 AS TwoPpct_adv,
        a.eFG AS eFGpct_adv,
        a.FT AS FT_adv,
        a.FTA AS FTA_adv,
        a.FT1 AS FTpct_adv,
        a.ORB AS ORB_adv,
        a.DRB AS DRB_adv,
        a.TRB AS TRB_adv,
        a.AST AS AST_adv,
        a.STL AS STL_adv,
        a.BLK AS BLK_adv,
        a.TOV AS TOV_adv,
        a.PF AS PF_adv,
        a.PTS AS PTS_adv,
        a.Awards AS Awards_adv,

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
    FULL OUTER JOIN dbo.Advanced_stats a
        ON p.Player = a.Player
    FULL OUTER JOIN dbo.Salary_data s
        ON p.Player = s.Player OR a.Player = s.Player
)

SELECT *
FROM joined
WHERE Player IS NOT NULL
  AND Team_pg IS NOT NULL
  AND Team_adv IS NOT NULL
  AND Team_salary IS NOT NULL;

