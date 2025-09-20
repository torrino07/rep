CREATE TABLE IF NOT EXISTS bots.Users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email TEXT UNIQUE NOT NULL,
    hashed_password TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    role TEXT DEFAULT 'bot',
    is_mfa_enabled BOOLEAN DEFAULT FALSE,
    mfa_secret TEXT,
    reset_token TEXT NULL,
    reset_token_expires TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    last_login TIMESTAMP
);
