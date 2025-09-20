
INSERT INTO bots.HealthCheck (status)
SELECT 'healthy'
WHERE NOT EXISTS (SELECT 1 FROM bots.HealthCheck);
