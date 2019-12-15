SELECT *
FROM information_schema.columns
WHERE table_scheme = 'SCHEMA_NAME'
      AND table_name = 'TABLE_NAME'
