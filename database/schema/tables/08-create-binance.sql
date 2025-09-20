CREATE TABLE IF NOT EXISTS bots.binancepairs (
  symbol     TEXT PRIMARY KEY,
  token0     TEXT NOT NULL,
  token1     TEXT NOT NULL,
  step_size  SMALLINT NOT NULL,
  tick_size  SMALLINT NOT NULL,
  min_qty    SMALLINT NOT NULL,
  topic_id   SMALLINT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
