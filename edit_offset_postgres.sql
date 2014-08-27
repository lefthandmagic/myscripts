DO
$BODY$
DECLARE
  m VARCHAR;
  --arr varchar[] := array['user_sessions', 'trip_client_ratings', 'trip_state_changes', 'trip_driver_ratings', 'trip_fare_splits', 'trips'];
  arr varchar[] := array['test'];
BEGIN
  FOREACH m IN ARRAY arr
  LOOP
        EXECUTE format('update %I set _offset=substring(_offset from %L) || lpad(CAST(substring(_offset from %L) as VARCHAR), 20, %L)', m, '(.*-)', '-(.*)$', '0');
  END LOOP;
END;
$BODY$ language plpgsql