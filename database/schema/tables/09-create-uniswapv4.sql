-- Uniswap V3 pools schema
CREATE TABLE IF NOT EXISTS bots.uniswappools (
  id      TEXT PRIMARY KEY,              -- Pool contract address (e.g., 0x...)
  symbol       TEXT NOT NULL,            -- Pair symbol label (e.g., ETHEX0)
  fee          SMALLINT NOT NULL,        -- Uniswap fee tier in hundredths of a bip (e.g., 100 = 0.01%)
  tick_spacing SMALLINT NOT NULL,        -- Uniswap V3 tick spacing for the pool
  liquidity    TEXT NOT NULL,            -- Uniswap V3 liquidity (uint128 fits in NUMERIC(39,0))
  id0          TEXT NOT NULL,            -- id0 symbol (e.g., ETH)
  id1          TEXT NOT NULL,            -- id1 symbol (e.g., EX0)
  symbol0      TEXT NOT NULL,            -- symbol0 (e.g., ETH)
  symbol1      TEXT NOT NULL,            -- symbol1 (e.g., EX0)
  name0        TEXT,                     -- name0 (e.g., Ethereum)
  name1        TEXT,                     -- name1 (e.g., Exomem)
  decimals0    SMALLINT NOT NULL,        -- decimals0
  decimals1    SMALLINT NOT NULL,        -- decimals1
  topic_id     SMALLINT NOT NULL,        -- topic_id
  created_at   TIMESTAMPTZ DEFAULT NOW()
);