SELECT 
airport_heliport.runway.id,
airport_heliport.runway_ts.valid_time_begin,
airport_heliport.runway_ts.valid_time_end,
airport_heliport.runway_ts.feature_lifetime_begin,
airport_heliport.runway_ts.feature_lifetime_end,
json_agg(airport_heliport.surfacecharacteristics_view.*) AS surfacecharacteristics

FROM airport_heliport.runway
INNER JOIN public.runway_timeslice
ON airport_heliport.runway.id = public.runway_timeslice.runway_id
INNER JOIN airport_heliport.runway_tsp
ON public.runway_timeslice.runway_tsp_id = airport_heliport.runway_tsp.id
INNER JOIN airport_heliport.runway_ts
ON airport_heliport.runway_tsp.runwaytimeslice_id = airport_heliport.runway_ts.id
LEFT JOIN airport_heliport.surfacecharacteristics_view
ON airport_heliport.runway_ts.surfaceproperties_id = airport_heliport.surfacecharacteristics_view.id
GROUP BY airport_heliport.runway.id