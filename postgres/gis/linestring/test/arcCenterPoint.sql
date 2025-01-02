WITH 
line (id, geom) AS (
    SELECT id, geom 
    FROM linestring
	WHERE linestring.type::text = 'arcbycenter'::text 

),
radius AS (
    SELECT 
        line.id,
        (ST_Distance(
            ST_PointN(line.geom, 1), 
            ST_PointN(line.geom, 2)
        ) 
        +
        ST_Distance(
            ST_PointN(line.geom, 2), 
            ST_PointN(line.geom, 3)
        )) / 2 AS dist
    FROM line
),
angles (id, start_angle, end_angle, step_size) AS (
    SELECT 
        line.id,
        ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 1)) AS start_angle,
        ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 3)) AS end_angle,
        mod(
            CAST(ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 3)) 
            - ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 1)) + 2 * PI() AS numeric),
            CAST(2 * PI() AS numeric)
        ) / 3 AS step_size
    FROM line
),
interpolated_points AS (
    SELECT 
        line.id,
        -- ST_Project(ST_PointN(line.geom, 2), radius.dist, start_angle + step_size * n) AS point_geom
        ST_MakePoint(
            ST_X(ST_PointN(line.geom, 2)) + DEGREES(
                ATAN2(
                    SIN(start_angle + step_size * n) * SIN(16619.8 / 6378137) * COS(RADIANS(ST_Y(ST_PointN(line.geom, 2)))),
                    COS(16619.8 / 6378137) - SIN(RADIANS(ST_Y(ST_PointN(line.geom, 2)))) * 
                    SIN(
                        ASIN(
                            SIN(RADIANS(ST_Y(ST_PointN(line.geom, 2)))) * COS(16619.8 / 6378137) +
                            COS(RADIANS(ST_Y(ST_PointN(line.geom, 2)))) * SIN(16619.8 / 6378137) * COS(start_angle + step_size * n)
                        )
                    )
                )
            ),
            DEGREES(
                ASIN(
                    SIN(RADIANS(ST_Y(ST_PointN(line.geom, 2)))) * COS(16619.8 / 6378137) +
                    COS(RADIANS(ST_Y(ST_PointN(line.geom, 2)))) * SIN(16619.8 / 6378137) * COS(start_angle + step_size * n)
                )
            )
        ) AS point_geom
		-- ST_Transform(
		--     ST_Project(
		--         ST_Transform(ST_PointN(line.geom, 2), 32633),
		--         42596,
		--         start_angle + step_size * n
		--     ),
		--     4326
		-- ) AS point_geom
    FROM 
        generate_series(0, 3) AS n,
        line
    JOIN radius ON line.id = radius.id
    JOIN angles ON line.id = angles.id
),
arc_line AS (
    SELECT 
        id,
        ST_MakeLine(point_geom) AS arc_geom
    FROM interpolated_points
    GROUP BY id
)
SELECT arc_line.arc_geom 
FROM arc_line;
